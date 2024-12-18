//Saber si un pirata es útil para una misión

class Barco {
    var property misionAsignada = busquedaDelTesoro    
    var property piratas = []
    var property capacidadMaxima 

    method reclutar(pirata) {                       //añadir un pirata que sirva al barco 
        if(pirata.esUtilParaMision(misionAsignada) && self.capacidadDisponible()>0) 
            piratas.add(pirata)
    }
    method esTemible() =                            //saber si un barco puede cumplir la mision
        misionAsignada.barcoCumple(self)
    method objetosAbordo() =                        //saber todos los objetos de todos los piratas
        piratas.map({pirata=>pirata.objetos()}) 
    method capacidadDisponible() = capacidadMaxima - piratas.size() 
    method cambiarDeMision(misionNueva) {
        self.misionAsignada(misionNueva)
        piratas.removeAllSuchThat({pirata => not(pirata.esUtilParaMision(misionNueva))})
    }
    method porcentajeDeTripulacion() = capacidadMaxima*100/piratas.size()
}
class Pirata {
    var property objetos = []
    var property monedas
    var property ebriedad = 0
    method anadirObjeto(elemento) {
        objetos.add(elemento)
    }
    method esUtilParaMision(mision) = mision.esUtil(self)

}
class CiudadCostera{

}
class Objeto {
    var property nombre
}

object busquedaDelTesoro {
    method esUtil(pirata) = 
        pirata.monedas()<5 && (pirata.objetos().any({ objeto => objeto.nombre() == "brujula" }) || 
                               pirata.objetos().any({ objeto => objeto.nombre() == "mapa" }) || 
                               pirata.objetos().any({ objeto => objeto.nombre() == "botella de Grog" }))
    method barcoCumple(barco) = 
        barco.objetosAbordo().any("llave del tesoro") && barco.porcentajeDeTripulacion()>90
}
class ConvertirseEnLeyenda {
    var property itemNecesario  
    method esUtil(pirata) = pirata.objetos().size()>10 && pirata.objetos().any(itemNecesario)
    method barcoCumple(barco) = barco.porcentajeDeTripulacion()>90
}
object cantidadMisionesDeSaqueo {   
    var property cantidad = null
    method cambiarCantidad(nuevoValor) {
        cantidad=nuevoValor
    }
}
class Saqueo {
    const cantidad=cantidadMisionesDeSaqueo
    method esUtil(pirata) = pirata.monedas()<cantidad.cantidad()
    method barcoCumple(barco) = barco.porcentajeDeTripulacion()>90
}

/** para hacer testeos

var barco1 = new Barco(capacidadMaxima=4)
var barco2 = new Barco(capacidadMaxima=1)
var mapa = new Objeto(nombre="mapa")
var llaveDelTesoro = new Objeto(nombre="llave del tesoro")
var brujula = new Objeto(nombre="brujula")
var botella = new Objeto(nombre="botella de Grog")

var ale = new Pirata(monedas=0)
ale.anadirObjeto(mapa)

var mari = new Pirata(monedas=3)
mari.anadirObjeto(brujula)
mari.anadirObjeto(llaveDelTesoro)

var agus = new Pirata(monedas=7)

var sofi = new Pirata(monedas=2)
sofi.anadirObjeto(botella)
sofi.anadirObjeto(botella)
sofi.anadirObjeto(mapa)

barco1.reclutar(ale)
barco1.reclutar(mari)
barco1.reclutar(agus)

barco2.reclutar(ale)
barco2.reclutar(mari)
barco2.reclutar(agus)
*/
