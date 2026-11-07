import nivel1.consumibles.*
import nivel2.mobsNivel2.*
import wollok.game.*
import alumno.*
import controles.*
import interfaz.mostrables.*
import interfaz.pantallas.*
import claseNivel.*
import consumible.*
import consumiblesNivel3.*
import mobsNivel3.*
import mapaNivel3.*
import estadosPantalla.*

object nivel3 inherits Nivel() {


  var tiempo = 50
  var finalizado = false
  var aulaAsignada = null
  const itemsRecolectados = #{}
  const itemsRequeridos = #{id, dni, hojaFormulas, utiles}

  const aulas = [
    new Aula(numero = 201, position = game.at(5, 13)),
    new Aula(numero = 202, position = game.at(10, 13)),
    new Aula(numero = 203, position = game.at(15, 13)),
    new Aula(numero = 204, position = game.at(20, 13)),
    new Aula(numero = 205, position = game.at(24, 13)),

    new Aula(numero = 206, position = game.at(5, 2)),
    new Aula(numero = 207, position = game.at(10, 2)),
    new Aula(numero = 208, position = game.at(15, 2)),
    new Aula(numero = 209, position = game.at(20, 2)),
    new Aula(numero = 210, position = game.at(24, 2))
  ]

  
  method iniciar() {
  juego.estadoActual(estadoNivel3)
  self.preparar()

  tiempo = 50
  finalizado = false
  aulaAsignada = null
  itemsRecolectados.clear()

  const jugador = juego.jugador()
  jugador.position(game.at(1, 7))

  game.addVisual(pantallaNivel3)

  [jugador, id, dni, hojaFormulas, utiles, bedelia, relojNivel3, ayudante].forEach({ elemento =>
    game.addVisual(elemento)
  })

  controles.keyboardControls(jugador)

  game.onCollideDo(jugador, { objetoChocado =>
    objetoChocado.interactuar(jugador)
  })

  game.onTick(1000, "relojNivel3", {
    self.pasarSegundo()
  })

  game.onTick(600, "moverAyudante", {
    ayudante.perseguirA(jugador)
  })
}
 method posicionPermitida(pos) = mapaNivel3.esTransitable(pos)

  method pasarSegundo() {
    if (not finalizado) {
      tiempo = (tiempo - 1).max(0)

      if (tiempo == 0) {
        self.perder()
      }
    }
  }

  method restarTiempo(segundos) {
    tiempo = (tiempo - segundos).max(0)
    if (tiempo == 0) {
      self.perder()
    }
  }

  method recolectar(unItem) {
    itemsRecolectados.add(unItem)
  }

  method tieneID() = itemsRecolectados.contains(id)
 
  method tiempo() = tiempo

 
method asignarAula() {
    if (aulaAsignada == null) {
      aulaAsignada = aulas.anyOne()
      game.say(juego.jugador(), "¡Te tocó el aula " + aulaAsignada.numero().toString() + "!")
      aulaAsignada.activarMeta()
    }
  }

  method puedeRendir() =
    aulaAsignada != null and itemsRequeridos.all({ item => itemsRecolectados.contains(item) })

  method ganar() {
    if (not finalizado and self.puedeRendir()) {
      finalizado = true
      self.finalizarCon(pantallaNivel3Completo)
    }
  }


 method perder() {
  if (not finalizado) {
    finalizado = true
    self.finalizarCon(pantallaSinTiempo)
    juego.estadoActual(estadoVolverMenu)
    juego.puedeReiniciarNivel(true)
    keyboard.j().onPressDo({
    juego.puedeReiniciarNivel(false)
    juego.reiniciarNivel()
  })
  }
}
  override method eventosAEliminar() = [
    "relojNivel3",
    "moverAyudante"
  ]
}
