

echo "Clonando el repositorio si no lo estaba para $1"
git clone git@github.com:INGCOM-UNRN-PII/$1.git tp2-2024-submissions/$1

echo "git pull en el repositorio $1"
git -C tp2-2024-submissions/$1 pull

echo "ejecutando verificaciones con gradle wrapper"
./tp2-2024-submissions/$1/gradlew -p tp2-2024-submissions/$1 check

echo "creacion del informe"
xsltproc stylesheets/checkstyle.xsl tp2-2024-submissions/$1/build/reports/checkstyle/main.xml | sed s@$PWD\/@@ - > mensaje.md
# xsltproc stylesheets/checkstyle.xsl tp2-2024-submissions/$1/build/reports/checkstyle/test.xml | sed s@$PWD\/@@ - >> mensaje.md

xsltproc stylesheets/pmd.xsl tp2-2024-submissions/$1/build/reports/pmd/main.xml | sed s@$PWD\/@@ - >> mensaje.md
# xsltproc stylesheets/pmd.xsl tp2-2024-submissions/$1/build/reports/pmd/test.xml | sed s@$PWD\/@@ - >> mensaje.md


cat mensaje.md
echo "Informe listo en $1.md"
#gh pr comment https://github.com/INGCOM-UNRN-PII/$1/pull/1 -F mensaje.md

mv mensaje.md $1.md
