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
    method text() = "Sueño: " + juego.jugador().sueno().toString() + "/70"
    method textColor() = "FFFFFFFF"
    method interactuar(personaje) {}
}

object bedelia {
  var property position = game.at(21, 7)

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
