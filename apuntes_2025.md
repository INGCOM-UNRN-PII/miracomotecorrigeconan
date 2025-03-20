Programación 2 - 2025-03-14 - Clase 4


TP OK ✅
Faltaron unos informes, concretamente el de PMD y el reporte
de ejecución de los tests; esto de todas formas es un detalle menor.


TP OK ✅
Revisá los comentarios y preguntá lo que tengas duda.

Tené en cuenta que estos comentarios no pasaran en futuras entregas.


Faltaron unos informes, concretamente el de PMD y el checkstyle; esto de todas formas es un detalle menor.

¿Y por qué no `boolean`?

¿Y `Scanner`? Un `main` así, es mas un test que un programa.

## `0x0004` - Los nombres de las funciones van en `dromedarioCase`


## `0x0005` - Los identificadores no son descriptivos; o son letras de contexto matemático o son palabras.

## `0x0006` - Un solo `return` por función

Solo porque la función, termina con dos puntos de salida diferentes; este y el `return` implícito al finalizar la función.


 ## `0x0007` - La documentación no sigue la forma dada
```java
    /**
     * Devuelve el valor absoluto de un número.
     * @param numero a eliminar su signo
     * @returns el numero sin signo
     */
    private static long valorAbsoluto(long numero) {
```

Versión extendida
```java
    /**
     * Devuelve el valor absoluto de un número.
     * @param numero a eliminar su signo
     * @returns el numero sin signo
     *      POST: se devuelve un valor con el mismo valor
     *              de numero sin signo.
     */
    private static long valorAbsoluto(long numero) {
```


## `0x000B` - Sin usar la asignación compuesta (`+=`,`*=`, etc)

## `0x000C` - Sin break y continue en su lugar, usen banderas

## `0x000E` - El test no sigue la estructura de test indicada

Debe ser, preparar / ejecutar / comprobar / limpiar Con identificación y mensajes


https://github.com/INGCOM-UNRN-PII/cursada-2025/blob/main/biblio-secundaria/markdown.pdf



Si el `assert` no obtenemos el resultado esperado, el tema es dejar un mensaje de por qué. Esto no siempre es posible, pero algo que al leer el mensaje en la lista de tests sea fácil de identificar qué pasó.

Esto para simplificar los mensajes y que no sea _tan_ laborioso.
