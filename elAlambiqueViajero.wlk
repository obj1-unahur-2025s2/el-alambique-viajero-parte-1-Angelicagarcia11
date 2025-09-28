object luke{
    var vehiculo = alambiqueVeloz
    var cantLugaresQueVisito = 0
    var recuerdo = ningunLugar.recuerdo()
    method viajarA(lugar){  
        if(lugar.puedeLlegar(vehiculo)){
            cantLugaresQueVisito = cantLugaresQueVisito + 1
            recuerdo = lugar.recuerdo()
            vehiculo.desgaste()
        }
    }
    method recuerdo() = recuerdo
    method cantViajes() = cantLugaresQueVisito
    method cambiarVehiculo(nuevoVehiculo){
        vehiculo = nuevoVehiculo
    }
        
}



//LUGARES
object paris{
    method puedeLlegar(vehiculo) = vehiculo.puedeFuncionar()
    method recuerdo() = "llavero Torre Eiffel"
}

object buenosAires{
    method puedeLlegar(vehiculo) = vehiculo.rapido()
    method recuerdo() = "mate"
}




object bagdad{
    var recuerdo ="bidon petroleo"
    method recuerdo() = recuerdo
    method recuerdoNuevo(recuerdoNuevo) {recuerdo = recuerdoNuevo}
    method puedeLlegar(vehiculo) = true
}

object lasVegas{
    var property homenajeA = paris
    method recuerdo() = homenajeA.recuerdo()
    method puedeLlegar(vehiculo) = homenajeA.puedeLlegar(vehiculo)
}

object ningunLugar{
    method recuerdo() = "ninguno"
}


//VEHICULOS
object alambiqueVeloz{
    var combustible = 20
    const consumoPorViaje = 10
    method puedeFuncionar() = combustible >= consumoPorViaje
    method desgaste() {combustible = combustible - consumoPorViaje}
    method rapido() = true
}


object chatarra {
    var cañones = 10
    var municiones = "ACME"
    method puedeFuncionar() = municiones == "ACME" and cañones.between(6,12)
    method rapido() = municiones.size() < cañones
    method desgaste(){
        cañones = (cañones / 2).roundUp(0) //redondea para arriba (0 decimales)
        if (cañones < 5 )
          municiones = municiones + " Obsoleto"
    }
    method patenteValida() = municiones.take(4) == "ACME" 
    method cañones() = cañones

}

object antigualla{
    var gangsters = 7
    method puedeFuncionar() = gangsters.even()
    method desgaste() {gangsters = gangsters - 1}
    method rapido() = gangsters >6
    method patenteValida() = chatarra.rapido() 

}


object convertible{
    var convertido = antigualla
    method puedeFuncionar() = convertido.puedeFuncionar()
    method desgaste() = convertido.desgaste()
    method rapido() = convertido.rapido()
    method cambiarA(nuevoVehiculo){convertido = nuevoVehiculo}
    method patenteValida() = convertido.patenteValida()
}
