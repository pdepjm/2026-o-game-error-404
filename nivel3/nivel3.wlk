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

object nivel3 inherits Nivel() {


  var tiempo = 50
  var finalizado = false

  var tieneID = false
  var aulaAsignada = false
  var tieneDNI = false
  var tieneHojaFormulas = false
  var tieneUtiles = false


  var aula = null

  method iniciar() {
    
    juego.estadoPantalla("nivel3")
    self.preparar()

    tiempo = 50
    finalizado = false

    tieneID = false
    aulaAsignada = false
    tieneDNI = false
    tieneHojaFormulas = false
    tieneUtiles = false
    aula = null


    const jugador = juego.jugador()
    jugador.position(game.at(1, 7))

    game.addVisual(pantallaNivel3)

    [
      jugador,id, sube,  hojaFormulas, utiles, bedelia,relojNivel3
    
    ].forEach({ elemento => game.addVisual(elemento)})

    controles.keyboardControls(jugador)

    game.onCollideDo(jugador, {objetoChocado => objetoChocado.interactuar(jugador)})

    game.onTick(1000, "relojNivel3", {
      self.pasarSegundo()
    })
  }
 method posicionPermitida(pos) =
  pos.x().between(1, 28) and
  pos.y().between(3, 12)

  method pasarSegundo() {
    if (not finalizado) {
      tiempo = (tiempo - 1).max(0)

      if (tiempo == 0) {
        self.perder()
      }
    }
  }

  method conseguirID() {
    tieneID = true
  }

  method tieneID() = tieneID

  method conseguirDNI() {
    tieneDNI = true
  }

  method conseguirHojaFormulas() {
    tieneHojaFormulas = true
  }

  method conseguirUtiles() {
    tieneUtiles = true
  }

 
  method aulaAsignada() = aulaAsignada
  method aula() = aula
  method tiempo() = tiempo

 
method asignarAula() {
  if (not aulaAsignada) {
    aula = (201..210).anyOne()
    aulaAsignada = true
    game.say(juego.jugador(), "¡Te tocó el aula " + aula.toString() + "!")
    exclamacionNivel3.aparecerEnAula(aula)
  }
}

  method puedeRendir() =
  tieneID and aulaAsignada and
  tieneDNI and tieneHojaFormulas and tieneUtiles

  method ganar() {
    if (not finalizado) {
      if (self.puedeRendir()) {
        finalizado = true
        self.finalizarCon(pantallaNivel3Completo)
      }
    }
  }



  method perder() {
    if (not finalizado) {
      finalizado = true
      self.finalizarCon(pantallaSinTiempo)
    }
  }

  override method eventosAEliminar() = [
    "relojNivel3"
  ]
}
