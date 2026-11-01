import wollok.game.*
import alumno.*
import nivel1.nivel1.*
import nivel2.nivel2.*
import nivel3.nivel3.*


object plata {
    method position() = game.at(1, 13)
    method text() = "Plata: " + juego.jugador().dinero().toString()
    method textColor() = "FFFFFFFF"
    method interactuar(personaje) {}
}

object reloj {
  method position() = game.at(1, 14)
  method text() = "Tiempo: " + juego.jugador().tiempo().toString()
  method textColor() = "FFFFFFFF"
  method interactuar(personaje) {}
}

object saldo {
    method position() = game.at(1, 12) //para agra
    method text() = "Saldo: " + juego.jugador().saldo().toString()
    method textColor() = "FFFFFFFF"
    method interactuar(personaje) {}
}

object suenoVisual {
    method position() = game.at(1, 13)
    method text() = "Sueño: " + juego.jugador().sueno().toString() + "/40"
    method textColor() = "FFFFFFFF"
    method interactuar(personaje) {}
}

object bedelia {
  var property position = game.at(8, 5)

  method image() = "bedelia.png"

  method interactuar(personaje) {
    if (nivel3.tieneID()) {
      nivel3.informarComision()
    } else {
      game.say(personaje, "Necesitás presentar tu legajo primero")
    }
  }
}

object pizarron {
  var property position = game.at(15, 12)

  method image() = "pizarron.png"

  method interactuar(personaje) {
    if (nivel3.sabeComision()) {
      game.say(personaje, "¡Buscá tu aula en el pizarrón!")
    } else {
      game.say(personaje, "Primero tenés que pasar por Bedelía")
    }
  }
}


class NubeAula {
  const imagen
  const comision
  const numeroAula
  var property position = game.at(0, 0)

  method image() = imagen

  method interactuar(personaje) {
    if (nivel3.sabeComision()) {
      if (nivel3.aulaAsignada()) {
        game.say(personaje, "Ya encontraste tu aula")
      } else {
        if (nivel3.comision() == comision) {
          nivel3.asignarAula(numeroAula)
          game.say(personaje, "¡Tu aula es la " + numeroAula.toString() + "!")
          game.removeVisual(self)
        } else {
          game.say(personaje, "Esta no es tu aula")
        }
      }
    } else {
      game.say(personaje, "Primero tenés que consultar en Bedelía")
    }
  }
}

const nubeAula101 = new NubeAula(
  imagen = "nubeAula101.png",
  comision = "A",
  numeroAula = 101,
  position = game.at(10, 10)
)

const nubeAula204 = new NubeAula(
  imagen = "nubeAula204.png",
  comision = "B",
  numeroAula = 204,
  position = game.at(15, 10)
)

const nubeAula305 = new NubeAula(
  imagen = "nubeAula305.png",
  comision = "C",
  numeroAula = 305,
  position = game.at(20, 10)
)

object aulaFacultad {
  var property position = game.at(27, 7)

  method image() = "aulaFacultad.png"

  method interactuar(personaje) {
    if (nivel3.puedeRendir()) {
      nivel3.ganar()
    } else {
      game.say(personaje, "¡Todavía te faltan cosas para rendir!")
    }
  }
}

object relojNivel3 {
  method position() = game.at(1, 14)

  method text() =
    "Tiempo: " + nivel3.tiempo().toString()

  method textColor() = "FFFFFFFF"

  method interactuar(personaje) {}
}
