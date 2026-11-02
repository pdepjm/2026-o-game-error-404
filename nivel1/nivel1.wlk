import wollok.game.*
import alumno.*
import bondi.*
import consumibles.*
import efectos.*
import mobs.*
import interfaz.mostrables.*
import interfaz.pantallas.*
import controles.*
import fases.*
import claseNivel.*
import mapaNivel1.*

object nivel1 inherits Nivel() {

  var faseActual = faseEsperandoBondi

  method iniciar() {
    juego.estadoPantalla("nivel1")
    self.preparar()
    faseActual = faseEsperandoBondi
    
    const jugadorElegido = juego.jugador()
    jugadorElegido.position(game.at(0, 0))

    game.addVisual(fondoMapa)
    game.addVisual(jugadorElegido)

  [
  reloj,plata, saldo, sube, kiosco, fisura, vecino,policia,billete100,
  billete200,billete500,billete1000, autoRojo, autoAzul, autoVerde,taxi
].forEach({ elemento => game.addVisual(elemento)
})
   
    controles.keyboardControls(jugadorElegido)

    game.onCollideDo(jugadorElegido, {
      objetoChocado =>
        objetoChocado.interactuar(jugadorElegido)
    })

    game.onTick(150, "seMueveFisura", { fisura.moverse() })
    game.onTick(100, "seMuevePolicia", { policia.moverse() })

    game.onTick(60, "moverAutos", {
      autoRojo.moverse()
      autoAzul.moverse()
      autoVerde.moverse()
      taxi.moverse()
    })

    game.onTick(1000, "relojNivel1", {
      self.pasarSegundo()
    })


  }

  method pasarSegundo() {
    faseActual.pasarSegundo()
  }

  method cambiarFase(faseNueva) {
    faseActual = faseNueva
  }


  method terminarPorTiempo() {
    game.say(juego.jugador(), "Uh la pucha, se me fue el bondi")

    game.schedule(1500, {
        self.finalizarCon(pantallaSinTiempo)
        juego.estadoPantalla("volverMenu")
    })
}

  method posicionPermitida(pos) = mapaNivel1.esTransitable(pos)
  
  override method eventosAEliminar() = [
    "relojNivel1",
    "seMueveFisura",
    "seMuevePolicia",
    "moverAutos"
  ]
}


