import wollok.game.*
import pantallas.*
import nivel1.*

object cafe {
  method aplicarEfecto(personaje) {
    nivel1.agregarTiempo(5)
  }
}

object robo {
  method aplicarEfecto(personaje) {
    personaje.pierdeDinero(personaje.dinero() / 2)
  }
}

object frenar {
  method aplicarEfecto(personaje) {
    nivel1.consumirTiempo(15)
  }
}

object meterEnCana {
  method aplicarEfecto(personaje) {
    game.schedule(1500, {
      game.clear()
      game.addVisual(pantallaPreso)
    })
  }
}

object pisar {
  method aplicarEfecto(personaje) {
    game.say(personaje, "Upa! Me atropellaron")
    nivel1.consumirTiempo(20)
    personaje.pierdeDinero(100)
    personaje.position(game.at(0, 0))
  }
}

object nubeAlcanza {
  method aplicarEfecto(personaje) {
    personaje.aumentarSueno(20)
  }
}