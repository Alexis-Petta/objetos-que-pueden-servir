/*
Los Bíclopes tienen dos ojos y son bastante útiles para todas las tareas, pero su estamina está limitada a un máximo de 10 puntos.

Los Cíclopes tienen un solo ojo, lo cual hace que les cueste bastante apuntar un arma (sólo aciertan la mitad de los disparos),
pero siempre están entusiasmados y no tienen un límite a la estamina que pueden tener.
*/

//--------------------------------------CLASES DE LOS EMPLEADO--------------------------------------
class Empleado {
    var property stamina=0
    var rol
    method cambiarRol(rolNuevo) {
        if (rolNuevo==soldado)
            soldado.punteria(0)
        rol=rolNuevo
    }
    method puedeArreglarMaquina(maquina) = stamina>maquina.complejidad() && /*(maquina.herramientasNecesarias().any(obrero.cinturon) ||*/ maquina.herramientasNecesarias().isEmpty()//)
    method arreglarMaquina(maquina) {
        if(self.puedeArreglarMaquina(maquina))
            stamina=stamina-maquina.complejidad()
    }

}
//--------------------------------------CLASES DE LOS MINIONS---------------------------------------
class Biclope inherits Empleado{
    const staminaMax = 10
}

class Ciclope inherits Empleado{
  
}
//--------------------------------------ROLES-------------------------------------- 
object soldado {
    var property punteria=0
    method cambiarPunteria(punteriaACambiar) {
        punteria=punteria+punteriaACambiar
    }
}
object obrero {
    var cinturon = []
}
object mucama {
    var manosLimpias = true
}
//--------------------------------------MAQUINAS-------------------------------------- 
class Maquina {
    var property complejidad 
    var property herramientasNecesarias = []
}

/*Arreglar una máquina: Las máquinas tienen cierta complejidad asociada (puede ser desde un candado hasta un reactor nuclear) y cada una podría requerir distintas herramientas para arreglarla.
El requerimiento para poder arreglar una máquina es tener tanta estamina como complejidad tenga la máquina y tener las herramientas necesarias para arreglarla 
(nótese que si la máquina no requiere de ninguna herramienta, cualquier empleado con estamina suficiente puede arreglarla).
Trabajar en una máquina es agotador, así que los empleados pierden tantos puntos de estamina como complejidad de la máquina al arreglarla.
La dificultad para este tipo de tareas es el doble de la complejidad de la máquina.
*/




/*
También sabemos que, en el laboratorio, cada empleado tiene asignado un rol. Este rol se elige arbitrariamente, podría cambiar de un día para el otro y no depende de la raza del empleado 
(cualquier empleado podría tener cualquier rol). Los posibles roles existentes son soldado, obrero y mucama.

Los soldados están equipados con un arma que les facilita la defensa del laboratorio. Cada vez que un soldado usa su arma para defender un sector, gana práctica y se vuelve un poquito 
mejor con ella,  incrementando en 2 el daño que causa. Si por algún motivo el soldado cambia de rol, toda la práctica ganada se pierde.

Los obreros tienen un cinturón con varias herramientas (cada uno puede tener herramientas distintas).

Las mucamas prefieren tener las manos limpias, así que van a negarse a defender sectores.
*/