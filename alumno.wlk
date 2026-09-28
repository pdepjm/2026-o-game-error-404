import wollok.game.*
import bondi.*
import efectos.*
import consumibles.*

object alumno {
  var tiempo = 115
  var dinero = 0
  var tieneSube = false
  var saldo = 0
  var llegoBondi = false

  var property position = game.at(0, 0)
  method image() = "alumno.gif"

  method tiempo(nuevoTiempo) {
    tiempo = nuevoTiempo
  }

  method mover(nuevaPosicion) {
    if (self.posicionValida(nuevaPosicion)) {
      position = nuevaPosicion
    }
  }

  method posicionValida(pos) =
    pos.x() >= 0 and pos.x() < game.width() and
    pos.y() >= 0 and pos.y() < game.height()

  method pasarSegundo() {
    if (tiempo > 0) {
      self.consumirTiempo(1)
      if (tiempo == 0 and not llegoBondi) {
        llegoBondi = true
        bondi.aparecer()
      }
    } else {
      game.removeTickEvent("relojJuego")
      game.say(self, "Uh la pucha, se me fue")
      game.schedule(1500, { game.stop() })
    }
  }

  method consumirTiempo(perdida){
    tiempo = (tiempo - perdida).max(0)
  }
  method agregarTiempo(cantidad) {
    tiempo += cantidad
  }

  method tiempo() = tiempo
  method dinero() = dinero
  method saldo() = saldo
  method tieneSube() = tieneSube
  method llegoBondi()=llegoBondi

  method conseguirDinero(cantidad) {
    dinero += cantidad
  }
  method pierdeDinero(cantidadPerdida) {
    dinero -= cantidadPerdida
  }

  method conseguirSube(subeEncontrada) {
    saldo += subeEncontrada.saldo()
    tieneSube = true
  }
  method cargarSube(carga) {
    if (tieneSube and dinero >= carga) {
      dinero = dinero - carga
      saldo+=carga
    }
  }


  method subirAlBondi() = saldo>=bondi.precioBoleto()

}