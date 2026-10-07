import wollok.game.*
import pantallas.*

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
    if(personaje.tiempo()>15){
      personaje.consumirTiempo(15)
    }
    
  }

}

object meterEnCana{
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
        if(personaje.tiempo()>20){
            personaje.consumirTiempo(20)
        }
        personaje.pierdeDinero(100)
        personaje.position(game.at(0, 0))
    }
}