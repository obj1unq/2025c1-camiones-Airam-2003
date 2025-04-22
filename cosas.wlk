object knightRider {
	method peso() = 500
	
	method nroDeBultos() = 1
	
	method nivelPeligrosidad() = 10
}

object robot {
	method peligrosidad() = 30
}

object auto {
	method peligrosidad() = 15
}

object bumblebee {
	var forma = auto
	
	method forma(_forma) {
		forma = _forma
	}
	
	method peso() = 800
	
	method nroDeBultos() = 2
	
	method nivelPeligrosidad() = forma.peligrosidad()
}

object paqueteDeLadrillos {
	var nroDeLadrillos = 10
	
	method nivelPeligrosidad() = 2
	
	method nroDeLadrillos(_nroDeLadrillos) {
		nroDeLadrillos = _nroDeLadrillos
	}
	
	method corroborarNivelUnoDeBultos() {
		if (nroDeLadrillos <= 100) {
			return 1
		} else {
			self.corroborarNivelesDeBultos()
		}
	}
	
	method corroborarNivelesDeBultos() {
		if (nroDeLadrillos.between(101, 300)) {
			return 2
		} else {
			return 3
		}
	}
	
	method nroDeBultos() = self.corroborarNivelUnoDeBultos()
	
	method peso() = nroDeLadrillos * 2
}

object arenaAGranel {
	var peso = 20
	
	method peso(_peso) {
		peso = _peso
	}
	
	method peso() = peso
	
	method nroDeBultos() = 1
	
	method nivelPeligrosidad() = 1
}

object bateriaConMisiles {
	method peso() = 300
	
	method nroDeBultos() = 2
	
	method peligrosidad() = 100
}

object bateriaSinMisiles {
	method peso() = 200
	
	method nroDeBultos() = 1
	
	method peligrosidad() = 0
}

object bateriaAntiaerea {
	var modo = bateriaSinMisiles
	
	method modo(_modo) {
		modo = _modo
	}
	
	method peso() = modo.peso()
	
	method nroDeBultos() = modo.nroDeBultos()
	
	method nivelPeligrosidad() = modo.peligrosidad()
}

object contenedorPortuario {
	const property cosasAdentro = #{}
	
	method pesoTotalDeLasCosasAdentro() = cosasAdentro.fold(
		0,
		{ cosa => cosa.peso() }
	)
	
	method peso() = 100 + self.pesoTotalDeLasCosasAdentro()
	
	method totalDeBultosAdentro() = cosasAdentro.fold(
		0,
		{ cosa => cosa.nroDeBultos() }
	)
	
	method nroDeBultos() = 1 + self.totalDeBultosAdentro()
	
	method nivelPeligrosidad() = cosasAdentro.max(
		{ cosa => cosa.nivelPeligrosidad() }
	)
}

object residuosRadioactivos {
	var peso = 40
	
	method peso(_peso) {
		peso = _peso
	}
	
	method peso() = peso
	
	method nroDeBultos() = 1
	
	method nivelPeligrosidad() = 200
}

object embalajeDeSeguridad {
	var cosaEnvuelta = knightRider
	
	method cosaEnvuelta(_cosaEnvuelta) {
		cosaEnvuelta = _cosaEnvuelta
	}
	
	method peso() = cosaEnvuelta.peso()
	
	method nroDeBultos() = 2
	
	method nivelPeligrosidad() = cosaEnvuelta.nivelPeligrosidad() / 2
}