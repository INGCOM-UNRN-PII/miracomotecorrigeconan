
Necesito construir un cuestionario de 15 preguntas difíciles a desafiantes para un curso de programación orientado a objetos en java, e iremos construyendo preguntas en texto plano, en donde lo que no sea la pregunta en sí y su planteo comienza con // sobre diversos temas. Indica el grado de dificultad estimado, provee una categorización tipo 'tagging' y con un mínimo de 6 opciones. Da la salida como un solo bloque de texto en texto plano. 


martinvilu7311
array731


Un recordatorio, las excepciones de la familia `RuntimeException` no se declaran.

Solo se documentan.

https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/lang/IndexOutOfBoundsException.html

Todas las verificaciones sobre las posiciones debieran de ir a un método (quizas privado o protegido) para unificar la verificación de las posiciones y simplificar.






Siendo que todas las búsquedas son prácticamente iguales, podés unificar la búsqueda en sí en algo como
```java
public Contacto buscarPorNombre(Contacto aBuscar, Comparator<Contacto> forma)
```

Separá y ampliá los tests de los tipo de `Arreglo`

Enviá este código a un método protegido separado y reemplaza las duplicaciones de código

Estás completando una operación interna del `Contacto` fuera de la misma.

Estás accediendo a un atributo de `Contacto`, la búsqueda debe de ser por un método de la misma.

Sin getters/setters


Este trabajo será en equipo de hasta tres. Para defenderlo, sus entregas de TP deben estar en condiciones para promocionar; **pero también tendrá su propio hilo de Discussions y clases de consulta asignadas.** por lo que 
No está previsto extendernos más y esto probablemente sea remoto, por lo que necesitará la utilización de cámara.

TP6:

Este código esta duplicado con respecto a `Hora`, usá lo que ya esta implementado ahí.

La acción de copiar un arreglo en otro, debiera de estar en una función separada; así reducís los bloques de código _casi_ completamente duplicados al mínimo.

La verificación debiera de estar en un método separado así es mas facil de armar los test

Simplificá los lanzamientos de excepción; el `throws` funciona como un `return`; El camino `else` no es necesario

TP4:
TP OK ✅

Corregir ⚠️

Este TP tendrá su fecha de corte en el 19/4 por la noche, cosa de implementar las correcciones.

Mirá como está resuelta la duplicación de código al manipular el archivo en la solución del TP.

Esto no va acá; ya que la funcion debiera de retornar el contenido para que el main se encargue de mostrarlo como sea conveniente

Esta excepción no es lanzada en el código de la misma, o en su mayoría.

Usa un retorno de tipo int para que esta funcion pueda ser util en otros contextos aparte del `main`.

Hacer `print`/`printStackTrace` no es gestionar la excepción, es solo silenciar el mensaje que trae y esto hace que la función retorne un valor erróneo cuando hay una excepción.

Remové el uso de `print` de la función de `Archivos`, las funciones no dan resultados correctos ante errores, quien llama a las mismas no se entera de que falló.

Devolver un String acá es casi como hacer el print dentro de la función.

Está mal, pero no tan mal, la función debiera de retornar el contenido para que el main se encargue de mostrarlo como sea conveniente

Atajar para relanzar una excepción nueva saca información útil del lanzamiento original; ya de por sí, no hay nada que hacer en este punto. Dejá que siga su camino.
No es la forma correcta para gestionar la excepción.

Esto no lo cierra correctamente cuando hay una excepción, debe ir en una cláusula `finally` o usar try/resources.


¿Que excepcion se lanza acá? Esto no es la gestión de excepciones correcta.

TP5:

¿Se te ocurre alguna mejora?

Se ve bastante completo, pero la única cosa que puede llegar a faltar es apoyarse en otros objetos para implementar el comportamiento; lo que llama "Lista de objetos" necesita un toque de detalle extra.

Pensarlo en términos de como lo implementaría es una debilidad, te limita en lo que podés identificar.

ASCIIMOJI:
¯\\\_(ツ)\_/¯

\(•\_•\)
\( •\_•\)>⌐■-■
\(⌐■\_■\)

\(⌐■\_■\)
\( •\_•\)>⌐■-■
\(•\_•\)

No es estrictamente un error, pero podés aprovechar que `throws` funciona como un `return` y simplificar el `if` borrando el `else`.

Estas verificaciones, las podes enviar a una funcion, para simplificar los chequeos y las funciones.

En los nombres de las funciones de arreglo, no es necesario duplicar el hecho de que trabajan con arreglos; por ejemplo, `sumaArreglo`, puede ser directamente `suma`. El que trabaje con arreglos lo sabemos a partir de su/sus argumentos. 

Dado el tipo de excepción, ¿es necesario declarar su lanzamiento?

El argumento `capacidad`, duplica información con respecto a el atributo `length` de los arreglos.

Los `} catch (RuntimeException e) {` son demasiado generales
¿Quién del código del `try` lanza esta excepción?


No es necesario subir los reportes html, estos se arman al momento de corregir.

Los comentarios vistos el lunes sobre checkstyle y PMD serán mandatorios en el próximo TP. Así como las "cuestiones de estilo" vistas desde el principio.

Recordá la forma que deben tener los identificadores, en variables y argumentos.

Que en el próximo TP será mandatorio.



No hace falta cargar los reportes html
en el repositorio, estos se reemplazan 
al momento de corregir.


Un solo `return` por función.


El tipo del argumento no es el correcto, debiera ser `String`
El tipo de retorno no es el correcto, debiera ser `bool`
# Resultado de la entrega

:+1: 

Corregir ⚠️

TP OK ✅

TP Rechazado ❌ (revisar completo)

Entrega tarde ⏰



（╯°□°）╯︵┻━┻


ʕ•ᴥ•ʔ

ლ(ಠ益ಠლ)

(╬ ಠ益ಠ)

(⊙.☉)7

°‿‿°

щ（ﾟДﾟщ）

{•̃_•̃}



Acá entra en juego el uso de las excepciones, al dividir (`a/b`) no lo rodeas de un `try/catch`, este código no debiera de ser igual. El tipo de la excepción es importante. (lo vamos a ver hoy, porque es un tema que necesita guía para ir a donde debe, no es completamente intuitivo)

Pensá en el 'mejor prevenir que atajar', si podés evitar la excepción con un `if`, mejor.

El código es simple y no hay margen para 'probar' el manejo de excepciones.


Si se dan estas condiciones, la función no puede cumplir con su objetivo; debiera de lanzar una excepción.

Es importante en especial porque no está documentado que cuando el arreglo es nulo o de longitud cero se devuelve algo.


La longitud, a no ser que sea necesario cambiarla, ya está en el arreglo mismo; en `arreglo.length`


# Ejercicio 1
Se ve raro en el informe de Conan, pero el archivo esta bien.


# Ejercicio 2
No hace falta cambiar nada acá, solo tené en cuenta la separación (que de por sí es bastante pobre) entre lo que sale de tu programa con lo que corresponde a Gradle.

¿Qué pasa cuando le pasas una cadena?
¿Cuál es la salida?


# Ejercicio 3

Faltan algunos reportes. (no hace falta agregarlos, tenelos en cuenta para ver que pasa para el siguiente TP.

No hay ninguno de los informes cargados en el repositorio

# Ejercicio 4
El código esta igual, no se ve el uso de la herramienta indicada.


En la consigna no se pide cambiar de nombre, de esta manera, Conan no lo puede encontrar.
(No hace falta corregirlo, pero tenelo en cuenta para futuros TP en los que el archivo este dado)

# Ejercicio 5

El informe es muy escueto, ¿no hay código de Programación 1 para probar?

No estaría de más sumar algo de formato [Markdown](https://github.com/INGCOM-UNRN-PII/cursada-2024/blob/main/biblio-secundaria/markdown.pdf)

El archivo no se encuentra en el lugar indicado, siendo que la corrección hace mucho más uso de automación, es importante observar este tema para evitar reentregas a futuro.


gh --repo "INGCOM-UNRN-PII/tp1-2024-damianperezz" pr comment 1 -F reporte-tp1-2024-damianperezz.md 
gh --repo INGCOM-UNRN-PII/tp1-2024-damianperezz pr comment 1 -F reporte-tp1-2024-damianperezz.md 
