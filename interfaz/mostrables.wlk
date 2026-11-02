import wollok.game.*
import alumno.*
import nivel1.nivel1.*
import nivel2.nivel2.*
import nivel3.nivel3.*

object infoDinero {
  method position() = game.at(18, 9)
  method text() = "Plata: $" + juego.jugador().dinero().toString()
  method textColor() = "FFFFFFFF"
}

object infoTiempo {
  method position() = game.at(18, 8)
  method text() = "Tiempo: " + juego.jugador().tiempo().toString() + "s"
  method textColor() = "FFFFFFFF"
}

object infoDano {
  method position() = game.at(18, 7)
  method text() = "Daño: " + juego.jugador().danoAlumno().toString()
  method textColor() = "FFFFFFFF"
}


object plata {
    method position() = game.at(1, 13)
    method text() = "Plata: $" + juego.jugador().dinero().toString()
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
    method text() = "Sueño: " + juego.jugador().sueno().toString() + "/70"
    method textColor() = "FFFFFFFF"
    method interactuar(personaje) {}
}

object bedelia {
  var property position = game.at(25,7)

  method image() = "bedelia.png"

  method interactuar(personaje) {
    if (nivel3.tieneID()) {
      nivel3.asignarAula()
    } else {
      game.say(personaje, "Necesitás presentar tu legajo primero")
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
