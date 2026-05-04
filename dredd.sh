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
        
        # Repository Details
        {
            printf "\n# El Juez Dredd\n"
            printf "\n## Detalles del Repositorio\n"
            printf "**Repositorio Origin:** %s\n" "$(git -C "$repo" remote get-url origin)"
            printf "**Commit Procesado:** %s\n" "$(git -C "$repo" rev-parse HEAD)"
            printf "\n### Últimos 5 commits:\n"
            printf '```text\n'
            git -C "$repo" log -n 5 --oneline
            printf '```\n'
            printf "\n**branch/revision:** %s %s\n" "$(git -C "$repo" rev-parse --abbrev-ref HEAD)" "$(git -C "$repo" rev-parse --short HEAD)"
        } >> mensaje.md

        printf "\n## Checkstyle código" >> mensaje.md
        checkstyle_file="$repo/build/reports/checkstyle/main.xml"
        if [ -f "$checkstyle_file" ]; then
            xsltproc --novalid stylesheets/checkstyle.xsl "$checkstyle_file" | sed s@"$PWD"/@@ - >> mensaje.md
        else
            printf "\n> ⚠️ Archivo de reporte Checkstyle no encontrado.\n" >> mensaje.md
        fi

        printf "\n## PMD código" >> mensaje.md
        pmd_file="$repo/build/reports/pmd/main.xml"
        if [ -f "$pmd_file" ]; then
            xsltproc --novalid stylesheets/pmd.xsl "$pmd_file" | sed s@"$PWD"/@@ - >> mensaje.md
        else
            printf "\n> ⚠️ Archivo de reporte PMD no encontrado.\n" >> mensaje.md
        fi

        printf "\n## Conan ejecuta los Tests" >> mensaje.md
        test_results_dir="$repo/build/test-results/test"
        if [ -d "$test_results_dir" ] && [ "$(ls -A "$test_results_dir"/*.xml 2>/dev/null)" ]; then
            for filename in "$test_results_dir"/*.xml; do
                xsltproc --novalid stylesheets/junit.xsl "$filename" >> mensaje.md
            done
        else
            printf "\n> ⚠️ No se encontraron resultados de tests JUnit.\n" >> mensaje.md
        fi

        printf "\n## Covertura de Tests" >> mensaje.md
        jacoco_file="$repo/build/reports/jacoco/test/jacocoTestReport.xml"
        if [ -f "$jacoco_file" ]; then
            xsltproc --novalid stylesheets/jacoco.xsl "$jacoco_file" >> mensaje.md
        else
            printf "\n> ⚠️ Archivo de reporte JaCoCo no encontrado.\n" >> mensaje.md
        fi

        # Collapsible Log with sanitization
        printf "\n\n<details>\n<summary>Log de ejecución de Gradle (Click para expandir)</summary>\n\n" >> mensaje.md
        printf '```text\n' >> mensaje.md
        if [ -f "$2.log" ]; then
            # Sanitize: remove ANSI colors, carriage returns
            sed 's/\x1b\[[0-9;]*m//g' "$2.log" | tr -d '\r' >> mensaje.md
        else
            printf "Log no encontrado.\n" >> mensaje.md
        fi
        printf '```\n' >> mensaje.md
        printf "</details>\n" >> mensaje.md

        cat informe/footer.md >> mensaje.md

        printf "Informe listo en %s\n" "$2.md"
        mv mensaje.md "$2".md

        printf "\nbranch: %s \trevision: %s\n" "$(git -C "$repo" rev-parse --abbrev-ref HEAD)" "$(git -C "$repo" rev-parse --short HEAD)"

        git -C "$repo" log -n 5 --oneline origin/main

        printf "para completar el siguiente paso: ./comment.sh %s \"\"\n" "$2"
        printf "para revisar el comentario antes de cargarlo: glow %s.md\n" "$2"

else
    printf "El repositorio '%s no fue encontrado'\n" "$repo"

fi
