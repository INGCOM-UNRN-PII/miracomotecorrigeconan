#!/usr/bin/bash

echo "Procesando tp2-2024-submissions/$1"

if [ -d "tp2-2024-submissions/$1" ]; then
#    echo "Clonando el repositorio si no lo estaba para $1"
#    git clone git@github.com:INGCOM-UNRN-PII/$1.git tp2-2024-submissions/$1

    echo "git pull en el repositorio $1"
    git -C tp2-2024-submissions/$1 pull

    echo "ejecutando verificaciones con gradle wrapper"
    
    cp -fv build.gradle.timeout tp2-2024-submissions/$1/build.gradle  # Hotfix para activar timeout
    ./tp2-2024-submissions/$1/gradlew -p tp2-2024-submissions/$1 check
    cp -fv build.gradle.base tp2-2024-submissions/$1/build.gradle

    echo "creacion del informe"

    echo "# El Juez Dredd" > mensaje.md
    echo "## Checkstyle código" >> mensaje.md
    xsltproc stylesheets/checkstyle.xsl tp2-2024-submissions/$1/build/reports/checkstyle/main.xml | sed s@$PWD\/@@ - >> mensaje.md

    # echo "## Checkstyle tests" >> mensaje.md
    # xsltproc stylesheets/checkstyle.xsl tp2-2024-submissions/$1/build/reports/checkstyle/test.xml | sed s@$PWD\/@@ - >> mensaje.md

    echo "## PMD código" >> mensaje.md
    xsltproc stylesheets/pmd.xsl tp2-2024-submissions/$1/build/reports/pmd/main.xml | sed s@$PWD\/@@ - >> mensaje.md
    # echo "## PMD código" >> mensaje.md
    # xsltproc stylesheets/pmd.xsl tp2-2024-submissions/$1/build/reports/pmd/test.xml | sed s@$PWD\/@@ - >> mensaje.md

    echo "## Conan ejecuta los Tests" >> mensaje.md
    for filename in tp2-2024-submissions/$1/build/test-results/test/*.xml; do
        xsltproc stylesheets/junit.xsl $filename >> mensaje.md
    done

    echo "Informe listo en $1.md"
    mv mensaje.md $1.md
fi
