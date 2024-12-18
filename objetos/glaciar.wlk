

object compacto {
    method esAzul(tempano) = tempano.peso()>100
    method enfria(tempano) = tempano.pesoTotal()/100 
    method perdioPeso(unTempano){
		if(not unTempano.esGrande())
			unTempano.tipo(aireado)
	}
}

object aireado {
    method esAzul(tempano) = false
    method enfria(tempano) = 0.5
    method perdioPeso(unTempano){
		// Todo bien :D
	}
}

class Tempano {
    var tipo = compacto
    var property peso
    method esAzul() = tipo.esAzul(self)
    method parteVisible() = self.peso() * 0.15
    method enfria() = tipo.enfria(self)
    method esGrande() = peso>500
    method esAtractivo() = self.esGrande() || tipo.esAzul(self)
    method perderPeso(cantidad){
	peso = (peso - cantidad).max(0)
	tipo.perdioPeso(self)
	}
}

class MasaDeAgua{
    var tempanos = []
    method esAtractivo() = tempanos.size()>4 && tempanos.all({tempano=>tempano.esAtractivo()})
    method temperatura() = temperaturaAmbiente.temperatura() - tempanos.sum({tempano=> tempano.enfria()})
    method cantidadDeTempanosGrandes() = tempanos.filter({tempano => tempano.esGrande()}).size()
    method recibirTempano(tempanoNuevo) {
        tempanos.add(tempanoNuevo)    
    }
    method esNavegado() {
    tempanos.forEach({tempano =>tempano.perderPeso(1)})
    }
}

object temperaturaAmbiente {
    var property temperatura = null
}
class Lago inherits MasaDeAgua{
    method cumpleParaNavergar(embarcacion) = 
    not((self.cantidadDeTempanosGrandes()>=20 && embarcacion.tamano()<10) || 
    (self.temperatura()<0))
}

class Rio inherits MasaDeAgua{
    var property velocidadBase
    method velocidadDelAgua() = velocidadBase - self.cantidadDeTempanosGrandes()
    method cumpleParaNavergar(embarcacion) = embarcacion.fuerzaMotor()>self.velocidadDelAgua()
}

class Glaciar{
    var property desembocadura
    var property pesoTotal
    const temperatura = 1
    method pesoInicialTempano() = self.pesoTotal()/1000000 * self.desembocadura().temperatura()
    method desprendimiento() {
        const pesoTempano = self.pesoInicialTempano()
        pesoTotal = pesoTotal - pesoTempano
        self.desembocadura().recibirTempano(new Tempano(peso = pesoTempano))
    }
    method recibirTempano(tempanoNuevo) {
        pesoTotal = pesoTotal + tempanoNuevo.peso()
    }


}

class Embarcacion{
    var property tamano
    var property fuerzaMotor 
    method puedeNavegar(lugar) = lugar.cumpleParaNavergar(self)
    method navegar(lugar) {
        lugar.esNavegado()
    }
}

