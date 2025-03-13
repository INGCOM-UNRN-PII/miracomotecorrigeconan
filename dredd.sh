#!/usr/bin/bash

printf "Procesando %s-submissions/%s\n" "$1" "$2"
repo="$1-submissions/$2"

if [ -d "$repo" ]; then
    printf "git pull en el repositorio '%s'\n" "$repo"
    git -C "$repo" restore "*"
    git -C "$repo" pull

    git_pull_output=$(git -C "$repo" pull 2>&1)

    if [[ $git_pull_output == *"Already up to date."* || $git_pull_output == *"Ya está actualizado."* ]]; then
        printf "El repositorio ya estaba actualizado.\n"
    else
        printf "No se puede continuar, ha ocurrido un error en git.\n"
        printf "Git dice\n: %s\n" "$git_pull_output"
        exit 2
    fi


        printf "ejecutando verificaciones con gradle wrapper\n"

        cp -fv build.gradle.jacocofix "$repo"/build.gradle  # Hotfix para ignorar el Loader (y activar jacoco donde no exista)
        ./"$repo"/gradlew -p "$repo" check
        cp -fv build.gradle.base "$repo"/build.gradle     # Desactivamos el Hotfix para no bloquear los pull

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

        printf "para completar el siguiente paso:\n./comment.sh %s\n" "$2"

else
    printf "Clonando el repositorio si no lo estaba para %s, ejecutar una segunda vez para verificar\n" "$repo"
    printf "INGCOM-UNRN-PII/%s.git\n" "$2"
    git clone https://github.com/INGCOM-UNRN-PII/"$2".git "$repo"


fi
