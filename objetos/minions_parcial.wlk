    class Empleado {
        const property tipo     
        var property estaminaActual
        var property rol 
        var practicaDisparo = 0
        var herramientas = []
        var tareasRealizadas = 0
        var dificultadesRealizadas = 0

    method comer(fruta) {
        tipo.consumir(fruta, self)
    }
    method gastarStamina(gasto) {
        estaminaActual-=gasto
    }

    method ganarExperiencia(sumaDeDificultad) { 
        tareasRealizadas+=1
        dificultadesRealizadas+=sumaDeDificultad        
    }

    method tieneStaminaSuficiente(consumo) = estaminaActual>consumo

    method puedeArreglarMaquina(maquina) = self.tieneStaminaSuficiente(maquina.complejidad()) && maquina.herramientasNecesarias().all(herramientas)
    method arreglarMaquina(maquina) {
        if(self.puedeArreglarMaquina(maquina))
            self.gastarStamina(maquina.complejidad())
            self.ganarExperiencia(maquina.complejidad()*2)
    }

    method fuerza() = self.tipo().calcularFuerza(self)+self.rol().calcularFuerza(self)
    method puedeDefender(amenaza) = self.fuerza()>=amenaza.amenaza() && (tipo != mucama)
    method defender (amenaza){
        if (self.tipo() != soldado){
            if(self.puedeDefender(amenaza)){
                estaminaActual=estaminaActual/2
                self.ganarExperiencia(tipo.expPorDefensa(amenaza))
                }
        }else
            self.ganarExperiencia(tipo.expPorDefensa(amenaza))
    }

    method puedeLimpiar(tamano) = self.tieneStaminaSuficiente(tamano.consumo())
    method limpiar(tamano) {
        if(self.tipo()!=mucama)
            if(self.puedeLimpiar(tamano))
                estaminaActual-=tamano.consumo()
        else
            self.ganarExperiencia(tipo.expPorDefensa(dificultadLimpieza.dificultad()))
    } 
}

object ciclope {
    method consumir(fruta, empleado) {
        empleado.estaminaActual(fruta.energiaARecuperar())
    }
    method calcularFuerza(minion) = 2+minion.estimaActual()/4
        method expPorDefensa(amenaza) = amenaza.amenaza()*2
}

object biclope {
    const estaminaMax = 10
    method consumir(fruta, empleado) {
        if (fruta.energiaARecuperar()+empleado.estaminaActual()<estaminaMax)
            empleado.estaminaActual(fruta.energiaARecuperar())
        else
            empleado.estaminaActual(10)
    }
    method calcularFuerza(minion) = 2+minion.estimaActual()/2
    method expPorDefensa(amenaza) = amenaza.amenaza()
}

object soldado {
    method calcularFuerza(minion) = minion.practicaDisparo()
}
object obrero {
    method calcularFuerza(minion) = 0
}   

object mucama {
    method calcularFuerza(minion) = 0
}

object banana {
    const energia = 10
    method energiaARecuperar() = energia
}

object manzana {
    const energia = 5
    method energiaARecuperar() = energia
}

object uva {
    const energia = 1
    method energiaARecuperar() = energia
}

class Maquina{  
    var property complejidad
    var property herramientasNecesarias = []
}

class Herramientas{

}

class Amenaza{
    var property amenaza
}

class Sector{
    var property tamano
}

object otraTamano{
    var property consumo = 1
}

object tamanoGrande {
    var property consumo = 4
}

object dificultadLimpieza {
  var property dificultad = 10
}