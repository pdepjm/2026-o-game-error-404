
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
  var sabeComision = false
  var aulaAsignada = false
  var tieneDNI = false
  var tieneHojaFormulas = false
  var tieneUtiles = false

  const comision = "B"
  var aula = null

  method iniciar() {
    juego.estadoPantalla("nivel3")
    self.preparar()

    tiempo = 50
    finalizado = false

    tieneID = false
    sabeComision = false
    aulaAsignada = false
    tieneDNI = false
    tieneHojaFormulas = false
    tieneUtiles = false
    aula = null

    const jugador = juego.jugador()
    jugador.position(game.at(1, 7))

    [
      jugador,id, dni,  hojaFormulas, utiles, bedelia,
      nubeAula101, nubeAula204, nubeAula305
    ].forEach({ elemento => game.addVisual(elemento)})

    controles.keyboardControls(jugador)

    game.onCollideDo(jugador, {objetoChocado => objetoChocado.interactuar(jugador)})

    game.onTick(1000, "relojNivel3", {
      self.pasarSegundo()
    })
  }

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

  method sabeComision() = sabeComision
  method comision() = comision
  method aulaAsignada() = aulaAsignada
  method aula() = aula
  method tiempo() = tiempo

  method informarComision() {
    if (not sabeComision) {
      sabeComision = true
      game.say(juego.jugador(), "¡Sos de la comisión B!")
    }
  }

  method asignarAula(unaAula) {
    aula = unaAula
    aulaAsignada = true
  }

  method puedeRendir() =
    tieneID and sabeComision and aulaAsignada and
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
