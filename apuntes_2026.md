TP OK ✅⏰

Entrega tarde, ya que estaba estipulado para el 11/3/2026 17:00:00


necesito una funcion de google sheets para calificar el nivel de riesgo de un alumno, en funcion del estado de los trabajos practicos



Declarar el lanzamiento de excepciones no controladas es un error.
[`IllegalArgumentException`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/IllegalArgumentException.html)



Declarar el lanzamiento de excepciones no controladas es un error.

[`NegativeArraySizeException`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/NegativeArraySizeException.html)

[`IllegalArgumentException`](https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/IllegalArgumentException.html)




Esta función, es un duplicado de la otra que tiene límites; es posible simplificar su código a:
```java
    public static int obtieneEntero(String mensaje, int intentos, Scanner escanearValor)
            throws NoMasIntentosException {
        return obtieneEntero(mensaje, intentos, escanearValor, Integer.MIN_VALUE, Integer.MAX_VALUE); 
```
Ya que, en definitiva, es exactamente lo mismo, pero más simple.



Una cuestión interesante, es que, como esta verificación es esencialmente la misma en todas las funciones que reciben un arreglo, la podés enviar a una función separada, que te ayuda a simplificar y centralizar el código de verificación.

```java
public void verificar(int[] arreglo){
    if (arreglo == null)) {
        throw new ArregloException("El arreglo es nulo.");
    }
    if (arreglo.length == 0) {
        throw new ArregloException("El arreglo está vacío.");
    }
```


Según lo visto en clases; si el test no está pensado para verificar el lanzamiento de la excepción, la misma se puede delegar para simplificar el caso.



Esta función, es un duplicado de la otra que tiene límites; es posible simplificar su código a:
```java
    public static int obtieneEntero(String mensaje, int intentos)
            throws NoMasIntentosException {
        return obtieneEntero(mensaje, intentos, Integer.MIN_VALUE, Integer.MAX_VALUE); 
```
Ya que, en definitiva, es exactamente lo mismo, pero más simple.


Cómo el `throws` actúa, de alguna forma, como un `return`, que el código esté en el camino `else` no es necesario.
