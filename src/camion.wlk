/*
 * Revisar objetosMasPeligrososQue(unaCosa) que podias reutilizar  objetosQueSuperanPeligrosidad(unNivel)
 */

import cosas.*

object camion {
	const carga = []
	
	method cargar(unaCosa) { carga.add(unaCosa) }
	method descargar(unaCosa) { carga.remove(unaCosa) }
	method todoPesoPar() = carga.all( { c => c.peso().even() } )
	method hayAlgunoQuePesa(unPeso) = carga.any( { c => c.peso() == unPeso } )
	method elDeNivel(unNivel) = carga.find( { c => c.nivelDePeligrosidad() == unNivel } )
	method pesoTotal() = carga.sum( { c => c.peso() } ) + 1000  // 1000 corresponden a la tara del camion
	method excedidoDePeso() = self.pesoTotal() >= 2500
	method objetosQueSuperanPeligrosidad(unNivel) = carga.filter( { c => c.nivelDePeligrosidad() > unNivel } )	
	//method objetosMasPeligrososQue(unaCosa) = carga.filter( { c => c.nivelDePeligrosidad() > unaCosa.nivelDePeligrosidad() } )
	method objetosMasPeligrososQue(unaCosa) = self.objetosMasPeligrososQue(unaCosa.nivelDePeligrosidad())
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) =
		not self.excedidoDePeso() and self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	method tieneAlgoQuePesaEntre(min, max) = carga.any( { c => c.peso().between(min, max) } )
	method cosaMasPesada() = carga.max( { c => c.peso() } )
	method pesos() = carga.map( { c => c.peso() } )
}
