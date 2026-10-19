import wollok.game.*
import nivel1.bondi.*

class Alumno {
  var dinero 
  var tieneSube = false
  var saldo = 0
  var sueno = 0
  const imagen
  const imagenMenu
  var tiempo = 20

  var property position = game.at(0, 0)
  method image() = imagen
  method imagenMenu() = imagenMenu

  method mover(nuevaPosicion) {
    if (self.posicionValida(nuevaPosicion)) {
      position = nuevaPosicion
    }
  }

  method posicionValida(nuevaPosicion) =
    self.estaDentroDelMapa(nuevaPosicion) and juego.nivelActual().posicionPermitida(nuevaPosicion)

  method estaDentroDelMapa(pos) =
    pos.x() >= 0 and pos.x() < game.width() and
    pos.y() >= 0 and pos.y() < game.height()

  method dinero() = dinero
  method saldo() = saldo
  method tieneSube() = tieneSube
  method sueno() = sueno
  method tiempo() = tiempo

  method agregarTiempo(cantidad) {
    tiempo += cantidad
  }

  method consumirTiempo(cantidad) {
    if (tiempo > cantidad) {
      tiempo -= cantidad
    }
  }

  method pasarSegundo() {
    tiempo = (tiempo - 1).max(0)
  }

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

//el pinguino es de prueba para el nivel 2, ya tiene el saldo suficiente para viajar y no espera a q spawnee el bondi
const pinguino = new Alumno(imagenMenu = "pinguino_menu.gif", imagen = "alumno.gif", dinero = 0, tiempo =5,saldo=4500)
<<<<<<< Updated upstream
const lucio   = new Alumno(imagenMenu = "lucio_menu.png", imagen = "lucio.png", dinero = 500, tiempo = 70)
const lari    = new Alumno(imagenMenu = "lari_menu.png", imagen = "lari.png", dinero = 1000, tiempo = 60)
const solci   = new Alumno(imagenMenu = "solci_menu.png", imagen = "solci.png", dinero = 800, tiempo = 50)
const alvarez = new Alumno(imagenMenu = "AlvarezMunu.png", imagen = "AlvarezJuego.png", dinero = 0, tiempo = 60, saldo = 0)
=======
const lucio    = new Alumno(imagenMenu = "lucio_menu.png", imagen = "lucio.png", dinero = 500, tiempo = 70)
const lari     = new Alumno(imagenMenu = "lari_menu.png", imagen = "lari.png", dinero = 1000, tiempo = 60)
const solci    = new Alumno(imagenMenu = "solci_menu.png", imagen = "solci.png", dinero = 800, tiempo = 50)
>>>>>>> Stashed changes

object juego {
  var property jugador = pinguino
  var property nivelActual = null
}