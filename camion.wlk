import cosas.*

object camion {
	const property cosas = #{}
	const pesoVacio = 1000
	
	method cargar(cosa) {
		cosas.add(cosa)
	}
	
	method descargar(cosa) {
		cosas.remove(cosa)
	}
	
	method todoPesoPar() = cosas.all({ cosa => cosa.peso().even() })
	
	method hayAlgunoQuePesa(peso) = cosas.any({ cosa => cosa.peso() == peso })
	
	method elDeNivel(nivel) = cosas.find(
		{ cosa => cosa.nivelPeligrosidad() == nivel }
	)
	
	method pesoTotal() = pesoVacio + cosas.fold(
		0,
		{ total, cosa => total + cosa.peso() }
	)
	
	method excedidoDePeso() = self.pesoTotal() > 2500
	
	method objetosQueSuperanPeligrosidad(nivel) = cosas.filter(
		{ cosa => cosa.nivelPeligrosidad() > nivel }
	)
	
	method objetosMasPeligrososQue(cosa) {
		const peligrosidadDeLaCosa = cosa.nivelPeligrosidad()
		
		return self.objetosQueSuperanPeligrosidad(peligrosidadDeLaCosa)
	}
	
	method hayAlgunoQueSuperePeligrosidad(nivelPeligrosidad) = cosas.any(
		{ cosa => cosa.nivelPeligrosidad() > nivelPeligrosidad }
	)
	
	method puedeCircularEnRuta(
		peligrosidadMaxima
	) = (!self.excedidoDePeso()) && (!self.hayAlgunoQueSuperePeligrosidad(
		peligrosidadMaxima
	))
	
	method tieneAlgoQuePesaEntre(min, max) = cosas.any(
		{ cosa => cosa.peso().between(min, max) }
	)
	
	method cosaMasPesada() = cosas.max({ cosa => cosa.peso() })
	
	method pesos() = cosas.map({ cosa => cosa.peso() })
	
	method totalBultos() = cosas.fold(0, { cosa => cosa.nroDeBultos() })
}