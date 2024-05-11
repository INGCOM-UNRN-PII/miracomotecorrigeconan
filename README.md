# Mirá como te corrige Conan

Este proyecto apunta a simplificar la corrección de Trabajos Prácticos, por el
momento, en una computadora, pero la idea que luego se pueda implementar usando
Github Actions.

La idea es unificar y automatizar todo lo posible para la revisión de un Trabajo 
Práctico para luego ser publicado como comentario en el Pull Request creado  
automáticamente por Github Classroom.

La documentación esta un poco desactualizada, que sorpresa, pero actualmente, la
mayoria de las acciones estan unificadas en dredd.sh. conan.sh se esta tomando unas
vacaciones para agregar acciones para ademas de verificar

## Prerequisitos
Esta pensado para funcionar sobre GNU/Linux, con xsltproc, git, java 17 y gh.cli instalado.
Aparte de eso, son scripts de Bash que hacen todo el trabajo.

## Acciones conan.sh
Se esta tomando actualmente unas vacaciones para agregar acciones para recopilar
tests e información de los repositorios, aparte de completar las verificaciones
para el TP1.

Esta herramienta ofrece un conjunto de acciones sobre el contenido del repositorio:

1. Si un archivo existe
2. Trae el contenido de un archivo
3. Compara el contenido un archivo contra otro.
 
## Acciones dredd.sh

### Uso del build system para llamar tests.

Usar el sistema de construcción para ejecutar tests y las verificaciones estaáticas.

Está previsto que la herramienta agregue tests adicionales traídos de un repositorio secundario
para una verificación mas exhaustiva.

## Construccion de un informe

Construye un comentario en formato markdown, para cargar al pull request de forma que sea
el primer paso en la corrección y una forma de marcar que el TP esta siendo corregido en ese
momento.


## ¿Cómo es la corrección?
De momento, no es posible decidir sobre el resultado de la verificación, en especial
cuando la consigna incluye la redacción de algo que no sea código.

Por lo que esta herramienta, solo reúne la entrega en un unico lugar para que el profesor
tome la decisión correcta, de la forma más rápida posible.

## Temas pendientes
El gran tema pendiente es cuando ejecutar este programa, de forma que solo sean
al momento de la entrega. El 'disparador', digamos.

Por ahora, esto es manual y no está previsto que cambie.

### Uso del build system para ejecutar el programa.

Invoca el sistema de construcción y ejecuta el programa para registrar la salida,
pasando argumentos de ser necesario.

Para esto es necesario pasar archivos, pero la forma que tiene gradle no hace de esto algo
facil

### Agregar tests y archivos adicionales

Para probar y ejercitar el practico, es necesario agregar mas casos de prueba, y archivos
para probar



# ¡Se aceptan comentarios y sugerencias!
