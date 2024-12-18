/* Ejercicio 1 - Pepita básica
Codificar a pepita en Wollok, con estos patrones de modificación de la energía:
cuando vuela, consume un joule por cada kilómetro que vuela, más 10 joules de "costo fijo" en cada vuelo.
cuando come, adquiere 4 joules por cada gramo que come.
No olvidar la inicialización.
Pepita ahora es mensajera, le enseñamos a volar sobre la ruta 9.
Agregar los siguientes lugares sobre la ruta 9, con el kilómetro en el que está cada una, y agregar lo que haga falta para que:
pepita sepa dónde está (vale indicarle un lugar inicial al inicializarla).
le pueda decir a pepita que vaya a un lugar, eso cambia el lugar y la hace volar la distancia.
pueda preguntar si pepita puede o no ir a un lugar, puede ir si le da la energía para hacer la distancia entre donde está y donde le piden ir.
Por ahora no validamos cuando le pedimos que vaya que pueda ir, eso lo agregaremos más adelante.
Pensar en particular
qué objeto se debe encargar del cálculo de la distancia entre dos lugares, piensen cómo lo preguntarían desde la consola. 
Si resulta que el cálculo se repite para distintos objetos… OK, después vamos a ver cómo arreglar eso.
cómo hago para no repetir en distintos métodos de pepita la cuenta de la energía que necesita para moverse una cantidad de kilómetros.
*/

object pepita {
    var property energia = 0
    var ubicacion = 0
    method volar(kilometros) = energia - kilometros - 10
    method comer(gramos) {
      energia = energia + gramos*4
    }
    method dondeEsta(){
        return ubicacion
    }
    method viajar(kilometrosARecorrer) {
        energia = self.volar(kilometrosARecorrer)
        ubicacion = ubicacion + kilometrosARecorrer
    }
    method puedeViajar(kilometros) = 0 < self.volar(kilometros) 
}