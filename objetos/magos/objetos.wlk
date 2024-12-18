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


/*
 var varita = new Varita(poderBase = 10)
 var tunicaComun = new TunicaComun()
*/