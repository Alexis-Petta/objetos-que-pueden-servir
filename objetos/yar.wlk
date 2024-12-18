
class Barco {
    var property capacidadMax
    var tripulantes = []
    var busquedaDelTesoro = new BusquedaDelTesoro()
    var convertirseEnLeyenda = new ConvertirseEnLeyenda()
    var saqueo = new Saqueo()
    method puedeRealizarse(mision) = mision.cumpleTodasLasCondiciones() && tripulantes.length()>capacidadMax*90/100
}
class BusquedaDelTesoro{
    method cumpleTodasLasCondiciones() = true
}
class ConvertirseEnLeyenda{
    method cumpleTodasLasCondiciones() = true
}
class Saqueo{
    method cumpleTodasLasCondiciones() = true
}

class Pirata {
    var property items = []
    var property ebriedad
    var property monedas
    method esUtilMision(mision)  {
        if(mision=="busqueda del tesoro")
        {
            items.any("brujula") && monedas<=5
        }
        else if(mision=="convertirse en leyenda"){
            items.lenght()>=10
        } 
        /*else if(mision=="saqueo"){
            
        }*/
    }
}