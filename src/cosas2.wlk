object knightRider {
	method peso() = 500
	method nivelDePeligrosidad() = 10
	method cantidadDeBultosEnCamion() = 1
	method consecuenciaDeLaCarga() {}
}

object bumblebee {
	var estaEnModoRobot

	method peso() = 800
	method nivelDePeligrosidad() = if (estaEnModoRobot) {30} else {15}
	method estaEnModoRobot(unValor) { estaEnModoRobot = unValor }
	method cantidadDeBultosEnCamion() = 2
	method consecuenciaDeLaCarga() { self.estaEnModoRobot(true) }
}

object paqueteLadrillos {
	var cantidadDeLadrillos = 0
		
	method peso() = cantidadDeLadrillos * 2
	method nivelDePeligrosidad() = 2
	method cantidadDeLadrillos(unaCantidad) { cantidadDeLadrillos = unaCantidad }
	method cantidadDeBultosEnCamion() = 
		if(cantidadDeLadrillos <= 100) {1} else if (cantidadDeLadrillos.between(101, 300)) {2} else {3}   
	method consecuenciaDeLaCarga() { cantidadDeLadrillos += 12 }
}

object arena {
	var peso = 0
		
	method peso() = peso
	method nivelDePeligrosidad() = 1
	method ingresarPeso(unPeso) { peso = unPeso }
	method cantidadDeBultosEnCamion() = 1
	method consecuenciaDeLaCarga() { peso += 20 }
}

object bateriaAntiarea {
	var tieneMisiles
	
	method peso() = if (tieneMisiles) {300} else {200}
	method nivelDePeligrosidad() = if (tieneMisiles) {100} else {0}
	method tieneMisiles(unValor) { tieneMisiles = unValor }
	method cantidadDeBultosEnCamion() = if(tieneMisiles) {2} else {1}   
	method consecuenciaDeLaCarga() { self.tieneMisiles(true) }
}

object contenedor {
	const cosasContenidas = []

	method peso() = cosasContenidas.sum( { c => c.peso() } ) + 100
	method nivelDePeligrosidad() = 
		if (cosasContenidas.isEmpty()) {0} else {cosasContenidas.map( { c => c.nivelDePeligrosidad() } ).max()}
	method agregarObjetoAlContenedor(unaCosa) { cosasContenidas.add(unaCosa) }
	method removerObjetoDelContenedor(unaCosa) { cosasContenidas.remove(unaCosa) }
	method cosasContenidas() = cosasContenidas
	method cantidadDeBultosEnCamion() = cosasContenidas.sum( { c => c.cantidadDeBultosEnCamion() } ) + 1
	method consecuenciaDeLaCarga() { cosasContenidas.forEach( { c => c.consecuenciaDeLaCarga() } ) }
}

object residuosRadioactivos {
	var peso
		
	method peso() = peso
	method nivelDePeligrosidad() = 200
	method ingresarPeso(unPeso) { peso = unPeso }
	method cantidadDeBultosEnCamion() = 1
	method consecuenciaDeLaCarga() { peso += 15 }
}

object embalajeSeguridad {
	var objetoQueContiene 
	
	method peso() = objetoQueContiene.peso()
	method nivelDePeligrosidad() = objetoQueContiene.nivelDePeligrosidad() * 0.5
	method embalarObjeto(unObjeto) { objetoQueContiene = unObjeto } 
	method cantidadDeBultosEnCamion() = 2
	method consecuenciaDeLaCarga() {} 
}
