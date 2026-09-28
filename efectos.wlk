import wollok.game.*

object cafe {
  method aplicarEfecto(personaje) {
    personaje.agregarTiempo(5)
  }
}

object robo {
  method aplicarEfecto(personaje) {
    personaje.pierdeDinero(personaje.dinero()/2)
  }

}

object frenar {
  method aplicarEfecto(personaje) {
    personaje.consumirTiempo(15)
  }

}

object meterEnCana{
  method aplicarEfecto(personaje) {
    game.schedule(1500, { game.stop() })
  }
}