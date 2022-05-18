/*
 * Revisar:  nivelDePeligrosidad() del contenedor para no usar el map
 * Recordá que podes usar var property cuando lo consideres necesario Por ejemplo en cantidadDeLadrillos
 */
object knightRider {
	method peso() = 500
	method nivelDePeligrosidad() = 10
}

object bumblebee {
	var estaEnModoRobot

	method peso() = 800
	method nivelDePeligrosidad() = if (estaEnModoRobot) {30} else {15}
	method estaEnModoRobot(unValor) { estaEnModoRobot = unValor }
}

object paqueteLadrillos{
	var cantidadDeLadrillos = 0
		
	method peso() = cantidadDeLadrillos * 2
	method nivelDePeligrosidad() = 2
	method cantidadDeLadrillos(unaCantidad) { cantidadDeLadrillos = unaCantidad }
}

object arena {
	var peso
		
	method peso() = peso
	method nivelDePeligrosidad() = 1
	method ingresarPeso(unPeso) { peso = unPeso }
}

object bateriaAntiarea {
	var tieneMisiles
	
	method peso() = if (tieneMisiles) {300} else {200}
	method nivelDePeligrosidad() = if (tieneMisiles) {100} else {0}
	method tieneMisiles(unValor) { tieneMisiles = unValor }
}

object contenedor {
	const cosasContenidas = []

	method peso() = cosasContenidas.sum( { c => c.peso() } ) + 100
	method nivelDePeligrosidad() = 
		//if (cosasContenidas.isEmpty()) {0} else {cosasContenidas.map( { c => c.nivelDePeligrosidad() } ).max()}
		if (cosasContenidas.isEmpty()) {0} else {cosasContenidas.max( { c => c.nivelDePeligrosidad() } ).nivelDePeligrosidad()}
	method agregarObjetoAlContenedor(unaCosa) { cosasContenidas.add(unaCosa) }
	method removerObjetoDelContenedor(unaCosa) { cosasContenidas.remove(unaCosa) }
	method cosasContenidas() = cosasContenidas
}

object residuosRadioactivos {
	var peso
		
	method peso() = peso
	method nivelDePeligrosidad() = 200
	method ingresarPeso(unPeso) { peso = unPeso }
}

object embalajeSeguridad {
	var objetoQueContiene 
	
	method peso() = objetoQueContiene.peso()
	method nivelDePeligrosidad() = objetoQueContiene.nivelDePeligrosidad() * 0.5
	method embalarObjeto(unObjeto) { objetoQueContiene = unObjeto } 
}




