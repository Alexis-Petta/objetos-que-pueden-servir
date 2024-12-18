class Mago {
    const property nombre
    var property categoria 
    const property poderInnato
    const property resistenciaMagica
    var property energiaMagica 
    var property objetos = []   
    method esMago() = true

    method nombreLongitud() = nombre.size()


    method poderTotal() = objetos.sum({objeto=>objeto.poderTotal(self)})

    method desafiarMago(mago) {
        if(mago.categoria().esVencido(self, mago)){
            energiaMagica= energiaMagica + mago.categoria().energiaVencido(mago)
            mago.energiaMagica(mago.energiaMagica()-mago.categoria().energiaVencido(mago)) 
        }
    }
}


/*

var varita = new Varita(poderBase = 10)
var tunicaComun = new TunicaComun()

var ale = new Mago(nombre="ale", categoria=veterano, poderInnato=10, resistenciaMagica=1, energiaMagica=100, objetos=[varita, tunicaComun, ojota])
var ale2 = new Mago(nombre="ale", categoria=aprendiz, poderInnato=10, resistenciaMagica=1, energiaMagica=100)
var alex = new Mago(nombre="alex", categoria=aprendiz, poderInnato=10, resistenciaMagica=1, energiaMagica=100, objetos=[varita, tunicaComun, ojota])
var mari = new Mago(nombre="mari", categoria=inmortal, poderInnato=1, resistenciaMagica=1, energiaMagica=10)
var goku = new Mago(nombre="goku", categoria=inmortal, poderInnato=1, resistenciaMagica=1, energiaMagica=10, objetos=[varita, tunicaComun, ojota, ojota, ojota])

var gremio1 = new Gremio(integrantes=[alex, mari])
var gremio2 = new Gremio(integrantes=[ale, ale2, gremio1])
var gremio3 = new Gremio(integrantes=[goku])

"Lider del Gremio: " + gremio3.liderGremio().nombre()

"energia de ale: " + ale.energiaMagica()
"energia de goku: " + goku.energiaMagica()
gremio1.desafiarMago(ale)
"energia de ale: " + ale.energiaMagica()
"energia de goku: " + goku.energiaMagica()

"Lider del Gremio: " + gremio3.liderGremio().nombre()

"energia de gremio1: " + gremio1.energiaMagica()
"energia de goku: " + goku.energiaMagica()
gremio3.desafiarGremio(gremio1)
"energia de gremio1: " + gremio1.energiaMagica()
"energia de goku: " + goku.energiaMagica()


gremio1.desafiarGremio(gremio2)
*/


//////////////////////////BORRAR

class Gremio{
    var property integrantes = []
    method esMago() = false

    method poderTotal() = integrantes.sum({miembro=>miembro.poderTotal()}) 
    method energiaMagica() = integrantes.sum({miembro=>miembro.energiaMagica()})
    method resistenciaMagica() = integrantes.sum({miembro=>miembro.resistenciaMagica()})
    
    method liderGremio() = 
    if(integrantes.max({miembro=>miembro.poderTotal()}).esMago())
        integrantes.max({miembro=>miembro.poderTotal()})
    else
        integrantes.max({miembro=>miembro.poderTotal()}).liderGremio()

    

    method desafiarMago(mago) {
        if(mago.categoria().esVencido(self, mago)){
            self.liderGremio().energiaMagica(self.liderGremio().energiaMagica() + mago.categoria().energiaVencido(mago))
            mago.energiaMagica(mago.energiaMagica()-mago.categoria().energiaVencido(mago)) 
        }
    }

    method desafiarGremio(gremio) {
        if(self.poderTotal()>gremio.resistenciaMagica()+gremio.liderGremio().resistenciaMagica())
            self.liderGremio().energiaMagica(self.liderGremio().energiaMagica() + gremio.integrantes().sum({mago=>mago.categoria().energiaVencido(mago)}))
            gremio.integrantes().forEach({mago=>mago.energiaMagica(mago.energiaMagica()-mago.categoria().energiaVencido(mago))})
    }
}

class Varita {
    const property poderBase 
    method poderTotal(mago) = 
    if (mago.nombreLongitud().even()) 
        poderBase * 1.5  
    else 
        poderBase
}
class TunicaComun{
    method poderTotal(mago) = mago.resistenciaMagica() * 2
}
class TunicaEpica{
    method poderTotal(mago) = mago.resistenciaMagica() * 2 + 10
}
class Amuleto {
    method poderTotal(mago) = 200
}
object ojota{
    method poderTotal(mago) = mago.nombreLongitud() * 10
}

object aprendiz {
    method esVencido(magoDesafiante, magoDesafiado) = magoDesafiado.resistenciaMagica() < magoDesafiante.poderTotal()
    method energiaVencido(magoDesafiado) = magoDesafiado.energiaMagica()/2
}


object veterano {
    method esVencido(magoDesafiante, magoDesafiado) = magoDesafiante.poderTotal() > magoDesafiado.resistenciaMagica() * 1.5
    method energiaVencido(magoDesafiado) = magoDesafiado.energiaMagica()/4
}

object inmortal {
    method esVencido(magoDesafiante, magoDesafiado) = false
    method energiaVencido(magoDesafiado) = 0
}