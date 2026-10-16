import wollok.game.*
import bondi.*

class Alumno {
  var dinero 
  var tieneSube = false
  var saldo = 0
  var sueno = 0
  const imagen
  const imagenMenu
  var property tiempo = 20

  var property position = game.at(0, 0)
  method image() = imagen
  method imagenMenu() = imagenMenu

  method mover(nuevaPosicion) {
    if (self.posicionValida(nuevaPosicion)) {
      position = nuevaPosicion
    }
  }

  method posicionValida(pos) =
    pos.x() >= 0 and pos.x() < game.width() and
    pos.y() >= 0 and pos.y() < game.height()

  method dinero() = dinero
  method saldo() = saldo
  method tieneSube() = tieneSube
  method sueno() = sueno

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
      saldo += carga
    }
  }

  method aumentarSueno(cantidad) {
    sueno = (sueno + cantidad).min(100)
  }

  method reducirSueno(cantidad) {
    sueno = (sueno - cantidad).max(0)
  }

  method subirAlBondi() = saldo >= bondi.precioBoleto()
}

const pinguino = new Alumno(imagenMenu = "pinguino_menu.gif", imagen = "alumno.gif", dinero = 0, tiempo =100)
const lucio    = new Alumno(imagenMenu = "lucio_menu.png", imagen = "lucio.png", dinero = 500, tiempo = 70)
const lari     = new Alumno(imagenMenu = "personaje_lari.png", imagen = "personaje_lari.png", dinero = 1000, tiempo = 60)

object juego {
  var property jugador = pinguino
}