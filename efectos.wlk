import wollok.game.*
import interfaz.pantallas.*
import nivel1.nivel1.*
import alumno.*
import estadosPantalla.*
object cafe {
  method aplicarEfecto(personaje) {
    personaje.agregarTiempo(5)
  }
}

object robo {
  method aplicarEfecto(personaje) {
    personaje.pierdeDinero(personaje.dinero() / 2)
  }
}

object frenar {
  method aplicarEfecto(personaje) {
    personaje.consumirTiempo(15)
  }
}


const tiempoTransicionPantalla = 1500

object meterEnCana {
  method aplicarEfecto(personaje) {
    game.schedule(tiempoTransicionPantalla, {
      nivel1.finalizarCon(pantallaPreso)
      juego.estadoActual(estadoMenu)
    })
  }
}


object pisar {
  method aplicarEfecto(personaje) {
    game.say(personaje, "Upa! Me atropellaron")
    personaje.consumirTiempo(20)
    personaje.pierdeDinero(100)
    personaje.position(game.at(0, 0))
  }
}

object nubeAlcanza {
  method aplicarEfecto(personaje) {
    personaje.aumentarSueno(20)
  }
}

