#!/usr/bin/bash

printf "Procesando %s-submissions/%s\n" "$1" "$2"
repo="$1-submissions/$2"

if [ -d "$repo" ]; then

        printf "ejecutando verificaciones con gradle wrapper\n"

        # Buscar casos de prueba en la carpeta de envíos
        for test_file in "$1-submissions"/*.java; do
            if [ -f "$test_file" ]; then
                # Leer la primera línea para extraer la ruta de destino
                first_line=$(head -n 1 "$test_file")
                if [[ "$first_line" == //LOCATION:* ]]; then
                    location=$(echo "$first_line" | sed 's#^//LOCATION:[[:space:]]*##; s#[[:space:]]*$##' | tr -d '\r')
                    target_dir="$repo/src/test/java/$location"
                    
                    printf "Copiando caso de prueba: %s -> %s\n" "$test_file" "$target_dir"
                    mkdir -p "$target_dir"
                    cp -fv "$test_file" "$target_dir/"
                fi
            fi
        done

        ./"$repo"/gradlew -p "$repo" clean > "$2.log" 2>&1
        ./"$repo"/gradlew -p "$repo" check >> "$2.log" 2>&1
        ./"$repo"/gradlew -p "$repo" analyzeAll >> "$2.log" 2>&1

        printf "creacion del informe\n"
        cat informe/header.md > mensaje.md
        printf "\n# El Juez Dredd" >> mensaje.md
        printf "\n**branch/revision:** %s %s", "$(git -C "$repo" rev-parse --abbrev-ref HEAD)", "$(git -C "$repo" rev-parse --short HEAD)" >> mensaje.md
        printf "\n## Checkstyle código" >> mensaje.md
        xsltproc stylesheets/checkstyle.xsl "$repo"/build/reports/checkstyle/main.xml | sed s@"$PWD"/@@ - >> mensaje.md

    #    printf "\n## Checkstyle tests" >> mensaje.md
    #    xsltproc stylesheets/checkstyle.xsl $repo/build/reports/checkstyle/test.xml | sed s@$PWD\/@@ - >> mensaje.md

        printf "\n## PMD código" >> mensaje.md
        xsltproc stylesheets/pmd.xsl "$repo"/build/reports/pmd/main.xml | sed s@"$PWD"/@@ - >> mensaje.md
    #    printf "\n## PMD tests" >> mensaje.md
    #    xsltproc stylesheets/pmd.xsl $repo/build/reports/pmd/test.xml | sed s@$PWD\/@@ - >> mensaje.md

        printf "\n## Conan ejecuta los Tests" >> mensaje.md
        for filename in "$repo"/build/test-results/test/*.xml; do
            xsltproc stylesheets/junit.xsl "$filename" >> mensaje.md
        done

        printf "\n## Covertura de Tests" >> mensaje.md
        xsltproc stylesheets/jacoco.xsl "$repo"/build/reports/jacoco/test/jacocoTestReport.xml >> mensaje.md

        cat informe/footer.md >> mensaje.md

        printf "Informe listo en %s\n" "$2.md"
        mv mensaje.md "$2".md

        printf "\nbranch: %s \trevision: %s\n", "$(git -C "$repo" rev-parse --abbrev-ref HEAD)", "$(git -C "$repo" rev-parse --short HEAD)"

        git -C "$repo" log -n 5 --oneline origin/main

        printf "para completar el siguiente paso: ./comment.sh %s \"\"\n" "$2"
        printf "para revisar el comentario antes de cargarlo: glow %s.md\n" "$2"

else
    printf "El repositorio '%s no fue encontrado'\n" "$repo"

fi
