import wollok.game.*
import bondi.*
import efectos.*
import consumibles.*
import pantallas.*

class Alumno {
  var tiempo 
  var dinero 
  var tieneSube = false
  var saldo = 0
  var llegoBondi = false
  const imagen
  const imagenMenu

  var property position = game.at(0, 0)
  method image() = imagen
  method imagenMenu() = imagenMenu

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
      game.schedule(1500, {
        game.clear()
        game.addVisual(pantallaSinTiempo)
      })
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
    dinero = (dinero - cantidadPerdida).max(0)
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

const pinguino = new Alumno(imagenMenu= "pinguino_menu.gif", imagen = "alumno.gif", tiempo=100, dinero=0)
const lucio    = new Alumno(imagenMenu= "lucio_menu.png", imagen = "lucio.png",tiempo=70, dinero=500)
const lari   = new Alumno(imagenMenu= "personaje_lari.png", imagen = "personaje_lari.png",tiempo=60, dinero=1000)



object juego {
  var property jugador = pinguino
}