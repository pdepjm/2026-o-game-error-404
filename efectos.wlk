object semaforo {
  method aplicarEfecto(personaje) {
    personaje.restarTiempo(5)
  }
}

object lluvia {
  method aplicarEfecto(personaje) {
    personaje.restarTiempo(10)
  }

}

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
    personaje.restarTiempo(15)
  }

}