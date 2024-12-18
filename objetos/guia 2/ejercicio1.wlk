/*ACME S.A. tiene una planta modelo en una bucólica zona rural lejos del tráfago urbano.
					
Para que la gente pueda llegar a la planta, la empresa tiene varios micros contratados. 
En cada micro entran N pasajeros sentados y M parados, donde el n y el m son particulares 
de cada micro (no son todos los micros iguales).
					
La gente no es toda igual, entonces para subirse a un micro se fija en distintas cosas:
•los apurados se suben siempre
•los claustrofóbicos se suben sólo si el micro tiene más de 120 m3 de volumen (se sabe el volumen de cada micro)
•los fiacas se suben sólo si entran sentados
•los moderados se suben sólo si quedan al menos x lugares libres (no importa si sentados o parados), donde el x es particular de cada persona moderada.
•los obsecuentes toman la misma decisión que tomaría su jefe (de cada empleado se sabe quién es su jefe, que es otro empleado).

Modelar a los micros y las personas de forma tal de:
•poder preguntarle a un micro si se puede subir a una persona, para lo cual tienen que darse dos condiciones: que haya lugar en el micro, y que la persona acepte ir en el micro.
•hacer que se suba una persona a un micro, si no puede, que tire error, donde "error"  es
    self.error('mensaje de error como String')
•hacer que se baje una persona de un micro, si no se puede (porque está vacío), que tire error
*/

class Micro {
    var pasajeros=[]
    var property lugaresSentados
    var property lugaresParados
    var property volumen

    method hayLugar() = lugaresParados+lugaresSentados > pasajeros.size()
    method hayAsientos() = pasajeros.size()<lugaresSentados
    method lugaresDisponibles() = lugaresParados+lugaresSentados-pasajeros.size()
    method estaEnMicro(persona) = pasajeros.contains(persona)  

    method subirPersona(persona) {
        if (self.hayLugar() && persona.puedeSubir(self))
            pasajeros.add(persona)
        else
            self.error("No puede subirse")
    }
    method bajarPesonsa(persona) {
        if(pasajeros!=[])
            pasajeros.remove(persona)
        else 
            self.error("El micro esta vacio")
    }
}

class Apurado {
    method puedeSubir(micro) = true
}
class Claustrofobico {
    method puedeSubir(micro) = micro.volumen() > 120
}
class Fiaca{
    method puedeSubir(micro) = micro.hayAsientos()
}
class Moderado{
    const property lugaresNecesarios
    method puedeSubir(micro) = micro.lugaresDisponibles()>lugaresNecesarios
}
class Obsecuente {
    var property jefe 
    method puedeSubir(micro) = micro.estaEnMicro(jefe) 
}
/*
 var micro1 = new Micro(lugaresSentados=20, lugaresParados=40, volumen= 130)
 var apurado1 = new Apurado()
 var claustrofobico1 = new Claustrofobico()
 var fiaca1 = new Fiaca()
 var moderado1 = new Moderado(lugaresNecesarios=4)
 var obsecuente1= new Obsecuente(jefe=apurado1)
 var micro2 = new Micro(lugaresSentados=0, lugaresParados=2, volumen= 20)
 */