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