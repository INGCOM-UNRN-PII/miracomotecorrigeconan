Programación 2 - 2025-03-14 - Clase 4


TP OK ✅
Faltaron unos informes, concretamente el de PMD y el reporte
de ejecución de los tests; esto de todas formas es un detalle menor.


TP OK ✅
Revisá los comentarios y preguntá lo que tengas duda.

Tené en cuenta que estos comentarios no pasaran en futuras entregas.

Los mensajes de Checkstyle en el informe indican que la herramienta de autoformato no fue utilizada. Esto necesitará una reentrega en futuras prácticas.


El próximo TP requerirá la utilización de `Scanner` para construir un `main` interactivo.

Esta bandera debiera de ir en el condicional para cerrar el lazo cuando la condición que representa deje de cumplirse.

Faltaron unos informes, concretamente el de PMD y el checkstyle; esto de todas formas es un detalle menor.

¿Y por qué no `boolean`?

¿Y `Scanner`? Un `main` así, es mas un test que un programa.

Los `assert` van con sus respectivos mensajes, que deben aportar información cuando este falle.

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


El `import` de todo con `*` no es correcto, no vimos el tema para que exista una regla, pero tendremos una.


Si el `assert` no obtenemos el resultado esperado, el tema es dejar un mensaje de por qué. Esto no siempre es posible, pero algo que al leer el mensaje en la lista de tests sea fácil de identificar qué pasó.

Esto para simplificar los mensajes y que no sea _tan_ laborioso.


####### TP3

Si te fijas, esta función es idéntica en a la otra, solo que más simple.
Lo único que realmente cambia, son los límites que debieran ser los representables a `int`

```suggestion
    public static int obtieneEntero(String mensaje, int intentos) throws NoMasIntentosException{
        return obtieneEntero(mensaje, intentos, Integer.MIN_VALUE, Integer.MAX_VALUE);
    }
```

Aunque correcto, siempre es mejor prevenir que atajar, usá `hasNextInt`


Recordá lo que vimos con respecto a `String` y las concatenaciones. Para estas situaciones, utilizá [`StringBuffer`](https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/lang/StringBuilder.html)
