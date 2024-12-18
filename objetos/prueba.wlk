class Animal {
    method hacerRuido()  =
        "silencio"
    
}

class Perro inherits Animal {
    override method hacerRuido() = "guau" + super()
}

class Gato inherits Animal {
    override method hacerRuido() =
        "miau" + super()
}

// Uso
const unPerro = new Perro()
const unGato = new Gato()
const unAnimal = new Animal()

//unPerro.hacerRuido() // "guau"
//unGato.hacerRuido()  // "miau"
//unAnimal.hacerRuido() // "silencio"