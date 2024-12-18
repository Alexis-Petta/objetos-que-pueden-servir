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