class Guerrero{
    var property armas = []
    var property elementos = []
    var property vida 
    method poder() = self.calcularPoder()
}

class Armas{
    var property poder 
}

class Hobbits inherits Guerrero {
    method calcularPoder() = vida+elementos.length()+armas.sum({Armas->Armas.poder()})
}