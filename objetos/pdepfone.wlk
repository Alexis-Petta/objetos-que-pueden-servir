class Linea {
    var property numero 
    var consumos = []
    method realizarConsumo(consumo) {
            consumos.add(consumo)
        } 
    method totalConsumido(consumo) = consumo.sum()
}

class Consumo {
	const property fechaRealizado = new Date()
}
class Llamada inherits Consumo{
    var property consumido 
    method calcularConsumo() = pdepfoni.precioFijoLlamadas + pdepfoni.costoMinuto * consumido     
}

class Internet inherits Consumo{
    var property consumido 
    method calcularConsumo() = pdepfoni.costoMB * consumido  
}

object pdepfoni {
	var property costoMB = 0.1
	var property costoMinuto = 1.5
	var property precioFijoLlamadas = 5
}