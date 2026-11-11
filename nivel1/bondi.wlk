import wollok.game.*
import alumno.*
import nivel1.*
import nivel2.nivel2.*
import interfaz.pantallas.*
import estados.*
import sonidos.*
object bondi {
    const precioBoleto = 670

    method precioBoleto() = precioBoleto
    method image() = "bondi.png"
    var property position = game.at(20, 0)

    method aparecer() {
        game.addVisual(self)
        juego.jugador().agregarTiempo(15)
        game.say(self, "¡Llegó el bondi! Tenés 15 segundos para subirte")
    }

    const tiempoEsperaTransicion = 1500

   method interactuar(personaje) {
  if (personaje.subirAlBondi()) {
    game.say(self, "Te alcanza, subite")

    game.schedule(tiempoEsperaTransicion, {
       sonidos.ganar()
      nivel1.finalizarCon(pantallaGanaste)
      juego.estadoActual(estadoPasarNivel2)
      estadoPasarNivel2.activar()
    })

  } else {
    game.say(self, "No llegas, bajate que la gente está yendo al trabajo pibe")

    game.schedule(tiempoEsperaTransicion, {
      sonidos.perder()
      nivel1.finalizarCon(pantallaSinSaldo)
      juego.estadoActual(estadoVolverMenu)
    })
  }
}
}