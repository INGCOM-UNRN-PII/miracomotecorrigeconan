#!/usr/bin/bash

echo "Procesando $1-submissions/$2"
repo="$1-submissions/$2"

if [ -d "$repo" ]; then
#    echo "Clonando el repositorio si no lo estaba para $repo"
#    git clone git@github.com:INGCOM-UNRN-PII/$1.git tp2-2024-submissions/$1

    echo "git pull en el repositorio $repo"
    git -C $repo pull

    echo "ejecutando verificaciones con gradle wrapper"

#    cp -fv build.gradle.timeout $repo/build.gradle  # Hotfix para activar timeout
    ./$repo/gradlew -p $repo check
#    cp -fv build.gradle.base $repo/build.gradle     # Desactivamos el Hotfix para no bloquear los pull

    echo "creacion del informe"

    echo "# El Juez Dredd" > mensaje.md
    echo "## Checkstyle código" >> mensaje.md
    xsltproc stylesheets/checkstyle.xsl $repo/build/reports/checkstyle/main.xml | sed s@$PWD\/@@ - >> mensaje.md

    # echo "## Checkstyle tests" >> mensaje.md
    # xsltproc stylesheets/checkstyle.xsl $repo/build/reports/checkstyle/test.xml | sed s@$PWD\/@@ - >> mensaje.md

    echo "## PMD código" >> mensaje.md
    xsltproc stylesheets/pmd.xsl $repo/build/reports/pmd/main.xml | sed s@$PWD\/@@ - >> mensaje.md
    # echo "## PMD tests" >> mensaje.md
    # xsltproc stylesheets/pmd.xsl $repo/build/reports/pmd/test.xml | sed s@$PWD\/@@ - >> mensaje.md

    echo "## Conan ejecuta los Tests" >> mensaje.md
    for filename in $repo/build/test-results/test/*.xml; do
        xsltproc stylesheets/junit.xsl $filename >> mensaje.md
    done

    echo "Informe listo en $2.md"
    mv mensaje.md $2.md
fi
