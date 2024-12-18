object bot{
    var property contrasena='d'
    var contrasenaTemporal= 'a'
    var palabra = "alexis"
    var intentos=0
    var palabras=[]
    method buscar(){
        if(contrasenaTemporal==contrasena)
            {return contrasenaTemporal}
        else
            {
                contrasenaTemporal = contrasenaTemporal+1
                intentos += 1
                self.buscar()
            }
    }
    method convertir() {
        var a = palabra.first()
        palabras.add(a)       
    }
}