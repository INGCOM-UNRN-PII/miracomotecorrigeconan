Programación 2 - 2025-03-14 - Clase 4


TP OK ✅
Faltaron unos informes, concretamente el de PMD y el reporte
de ejecución de los tests; esto de todas formas es un detalle menor.


TP OK ✅
Revisá los comentarios y preguntá lo que tengas duda.

Tené en cuenta que comentarios como los de la entrega no pasarán en futuras entregas.


Los mensajes de Checkstyle en el informe indican que la herramienta de autoformato no fue utilizada. Esto necesitará una reentrega en futuras prácticas.


El próximo TP requerirá la utilización de `Scanner` para construir un `main` interactivo.

Esta bandera debiera de ir en el condicional para cerrar el lazo cuando la condición que representa deje de cumplirse.

Faltaron unos informes, concretamente el de PMD y el checkstyle; esto de todas formas es un detalle menor.

¿Y por qué no `boolean`?

¿Y `Scanner`? Un `main` así, es mas un test que un programa.

Los `assert` van con sus respectivos mensajes, que deben aportar información cuando este falle.

## `0x0001` - Los nombres de las class van en `CamelloCase`

## `0x0002` - Variables, funciones y argumentos van en `dromedarioCase`

## `0x0003` - Los identificadores válidos son solo con alfabéticos `[azAZ]`

## `0x0004` - Los nombres de las funciones van en `dromedarioCase`

## `0x0004` - Los nombres de los métodos van en `dromedarioCase`

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

## `0x0008` - Las funciones no van con `printf` o `Scanner`

A no ser que sea explícitamente su propósito

## `0x0009` - Las constantes van en mayúsculas, con `SNAKE_CASE`

## `0x000A` - Un espacio antes y después de los operadores
Esta regla existe casi exclusivamente para exigirles el uso de autoformato, y aunque
el cambio en la prolijidad es realmente bajo, ayuda mucho a no perder de vista código
mas complejo.

## `0x000B` - Sin usar la asignación compuesta (`+=`,`*=`, etc)

## `0x000C` - Sin break y continue en su lugar, usen banderas

## `0x000D` - Debe tener el mismo nombre que la class con `Test` al final

## `0x000E` - El test no sigue la estructura de test indicada

Debe ser, preparar / ejecutar / comprobar / limpiar Con identificación y mensajes

## `0x000F` - Una llamada a función en cada caso de prueba

Salvo que estén fuertemente conectadas como en `DivisionLenta`

## `0x0010` - No atajar la excepción si no es posible tomar una decisión

## `0x0011` - El main de un programa no debe dejar pasar excepciones de tipo

## `0x0012` - Qué familia de excepciones se eligió debe de estar documentada

## `0x0013` - Usar argumentos como variables solo si no cambia su significado

## `0x0014` - No atajar una excepción lanzada en el mismo bloque

## `0x0015` - No convertir excepciones con tipo a sin tipo

## `0x0016` - Todas las excepciones que lancemos deben de estar documentadas con `@throws`
Si la misma excepcion se lanza en dos contextos diferentes, explicar cada uno de ellos.

Si es posible, incluir casos que estan fuera de nuestro control, como por ejemplo, los que
provengan de la librería.

## `0x0017` - Las excepciones de tiempo de ejecución deben documentar como evitar su lanzamiento

## `0x0018` - Sean específicos con lo que atajan, no está permitido atajar `Exception` o `RuntimeException`

## `0x0019` - La inicialización de los atributos va en el constructor

## `0x002A` - Las clases van en `CamelloCase` y sus atributos en `dromedarioCase`

## `0x02B` - { Los atributos `private` O `protected` con justificación } y nunca `public`

## `0x002C` - Los paquetes deben comenzar en `ar.unrn` e ir en minusculas.

## `0x002D` - Implementar `equals` requiere implementar `hashcode`

## `0x002E` - Al extender, sobreescribir solo para llamar a super no es correcto.
Excepto con el constructor.

## `0x002F` - Minimizar el código duplicado

## `0x0030` - Las clases, atributos y métodos llevan documentación

## `0x0031` - Los métodos get/set no pueden ser usados para la lógica del problema.
Esto incluye métodos que conceptualmente tengan la misma función.

## `0x0032` - La utilización de atributos estáticos debe de estar justificada

## `0x0033` - No hacer `import paquete.*`, solo traer lo que se necesita

## `0x0034` - No apilen líneas
Todos los bloques llevan sus llaves, y no encadenar más de ~dos llamadas a métodos en una línea

## `0x0035` - Documenten el lanzamiento indirecto de excepciones propias.
En especial, cuando se utilizan métodos internos de verificación.


--- --------nuevas reglas-----------

## `0xF000` - No es correcto declara el lanzamiento de una Excepcion no controlada.

La familia a la que pertenece `ArregloException` no hace que sea correcto declarar su lanzamiento.

## `0xF001` - No está permitido atajar para relanzar sin agregar información útil.
Esto significa que la mayoría de las situaciones en las que se intenta hacer _probablemente_ no sean correctas.

En este caso, se está perdiendo la información acerca del tipo y causa verdadera.

No está directamente relacionado al I/O, ya que el archivo pudo ser leído correctamente; debiera de ser una excepción propia.



## `0xF002` - Atajar para hacer algun tipo de `print` no es gestionar la excepción.

## `0xF003` - No esta permitido lanzar excepciones base, `Exception` o `RuntimeException`.


## `0xF004`- Aplicar el principio "mejor prevenir que atajar" siempre que sea posible.
Si se puede evitar una excepción con un `if`, es preferible hacerlo.

## `0xF005` - A la hora de construir cadenas, usar `StringBuilder`
Recordá lo que vimos con respecto a `String` y las concatenaciones. Para estas situaciones,
utilizá [`StringBuffer`](https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/lang/StringBuilder.html)

## `0x00` - Las clases van en `CamelloCase`

## `0x00` - Los atributos van en `dromedarioCase`

## `0x00` - Los atributos siempre `private`
Como maximo y debidamente justificado, `protected`. Pero nunca como `public`

## `0x00` - Los métodos de tipo `getter`/`setter` no estan permitidos.

## `0x00` - Las clases llevan su documentación que incluye la de sus atributos

## `0x00` - Eviten todo lo posible los retornos `null`
Y si esto no es posible, empleen `Optional`

## `0x00` - El código duplicado va en un método privado
Si se encuentran que hay una sección de código que estan copiando y pegando en cada una
de las funciones, este debe ir en una función o método separado.

Tengan en cuenta que esto simplifica los tests, al dejar pruebas mucho mas 'focalizadas'.

Estas funciones adicionales deben de tener sus pruebas.

Funciones como la verificacion de limites, si algún argumento es valido y demás situaciones similares.

## `0x00` - No apilen líneas
Vamos a ir viendo como Java se presta mucho más que C para esto, pero esto significa que si una línea
tiene mas de tres llamadas a método hay que dividirla.

## `0x00` - No duplicar en los nombres de los métodos con que tipo trabajan.
Por ejemplo con arreglos; `sumaArreglo` puede ser simplemente `suma`.

## `0x00` - Al documentar argumentos, no repitan el identificador
Redactando de forma que la explicación fluya del mismo, para esto, es necesario que el identificador sea
apropiado.



## `0x0000` - Sin errores de ortografía y apliquen formato markdown donde sea posible.
https://github.com/INGCOM-UNRN-PII/cursada-2025/blob/main/biblio-secundaria/markdown.pdf

NO hay excusas, el IDE tiene corrector de ortografía por lo que typos en los identificadores
y documentación no seran aceptados.

## `0x00` - Solo usar `import` a lo que se utiliza, no traer todo junto con `*`

El `import` de todo con `*` no es correcto, no vimos el tema para que exista una regla, pero tendremos una.


Si el `assert` no obtenemos el resultado esperado, el tema es dejar un mensaje de por qué. Esto no siempre es posible, pero algo que al leer el mensaje en la lista de tests sea fácil de identificar qué pasó.

Esto para simplificar los mensajes y que no sea _tan_ laborioso.


####### TP3

Como función y con tipo de retorno, ya sabemos que obtenemos algo.

Las funciones no necesitan indicar sobre que trabajan cuando los argumentos que estan a continuación lo indican.

Esto debiera de estar en una función aparte, ya que se repite en varias funciones.
Por ejemplo:

```java
public static void verificar(int[] arreglo)
```

Si te fijas, esta función es idéntica en a la otra, solo que más simple.
Lo único que realmente cambia, son los límites que debieran ser los representables a `int`

```suggestion
    public static int obtieneEntero(String mensaje, int intentos) throws NoMasIntentosException{
        return obtieneEntero(mensaje, intentos, Integer.MIN_VALUE, Integer.MAX_VALUE);
    }
```

Aunque correcto, siempre es mejor prevenir que atajar, usá `hasNextInt`

No es correcto declarar el lanzamiento de excepciones de esta familia.

Una cosa es que el arreglo esté vacío, pero otra muy diferente es que sea `null`.

Si el arreglo vino 'nulo', no hay arreglo para mostrar, lo cual debiera de ser una excepción.



Es muy importante ser específico sobre las situaciones que pueden provocar excepciones, lo que describís acá aplica a cualquier función que trabaje con archivos.

Estas superponiendo dos situaciones que, por lo menos, ameritan un mensaje separado


Hacer `throws ArregloException` no es correcto dada la familia de excepción a la que pertenece

https://github.com/orgs/INGCOM-UNRN-PII/discussions/53



La concatenación en un lazo tiene problemas que vimos en clase, es necesaria la utilización de []`StringBuilder`](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/lang/StringBuffer.html)


Quizás debas usar algo como
```suggestion
                if (contenidoArchivo.charAt(i) == System.lineSeparator()) {
```
Para que pueda procesar archivos creados en cualquier plataforma

[System.lineSeparator()](http://docs.oracle.com/javase/8/docs/api/java/lang/System.html#lineSeparator)



Debe de ser
```suggestion
    @Override
    public boolean equals(Object arr) {
```
y falta `hashCode`

Idealmente, usá `Arrays` y `Objects` para implementar `equals` y `hashCode`
