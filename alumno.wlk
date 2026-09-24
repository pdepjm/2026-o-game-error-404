import wollok.game.*
import bondi.*
import efectos.*
import consumibles.*

object alumno {
  var tiempo = 200
  var dinero = 0
  var tieneSube = false
  var saldo = 0
  var llegoBondi = false

  var property position = game.at(0, 0)
  method image() = "imagenes/alumno.gif"

  method mover(nuevaPosicion) {
    if (tiempo > 0 and self.posicionValida(nuevaPosicion)) {
      position = nuevaPosicion
      self.consumirTiempo(1)

      if (tiempo == 0 and not llegoBondi) {
        llegoBondi = true
        bondi.aparecer()
      }
    } else {
      if (tiempo == 0 and llegoBondi) {
        game.say(self, "Uh la pucha, se me fue")
        game.schedule(1500, { game.stop() })
      }
    }
  }

  method posicionValida(pos) =
    pos.x() >= 0 and pos.x() < game.width() and
    pos.y() >= 0 and pos.y() < game.height()

  method consumirTiempo(perdida){
    tiempo-=perdida
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

  method restarTiempo(cantidad) {
    tiempo = tiempo - cantidad
  }
  method agregarTiempo(cantidad) {
    tiempo = tiempo + cantidad
  }

  method subirAlBondi() = saldo>=bondi.precioBoleto()

}