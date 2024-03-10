# Mirá como te corrige Conan

Este proyecto apunta a simplificar la corrección de Trabajos Prácticos, por el
momento, en una computadora, pero la idea que luego se pueda implementar usando
Github Actions.

La idea es simplificar la corrección unificando todo lo necesario para la revisión
del Trabajo Práctico en un archivo que puede ser publicado como comentario del Pull
Request de corrección (como los creados automáticamente Github Classroom)

## Acciones
Esta herramienta ofrece un conjunto de acciones sobre el contenido del repositorio:

1. Si un archivo existe
2. Trae el contenido de un archivo
3. Compara el contenido un archivo contra otro.
 
## Acciones planeadas
### Uso del build system para llamar tests.

Usar el sistema de construcción para ejecutar tests, pero en particular, agregando tests
adicionales traídos de un repositorio secundario.

### Uso del build system para ejecutar el programa.

Invocar el sistema de construcción y ejecutar el programa para registrar la salida,
pasando argumentos de ser necesario, este sería como el próximo (próximo) paso.

## ¿Cómo es la corrección?
De momento, no es posible decidir sobre el resultado de la verificación, en especial
cuando la consigna incluye la redacción de algo que no sea código.

Por lo que esta herramienta, solo reúne la entrega en un unico lugar para que el profesor
tome la decisión correcta, de la forma más rápida posible.

## Temas pendientes
El gran tema pendiente es cuando ejecutar este programa, de forma que solo sean
al momento de la entrega. El 'disparador', digamos.

Por ahora, esto es manual y no está previsto que cambie.

# ¡Se aceptan comentarios y sugerencias!