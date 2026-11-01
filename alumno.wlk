import wollok.game.*
import nivel1.bondi.*
import nivel1.consumibles.*
import nivel2.balas.*

class Alumno {
  var dinero 
  var sueno = 0
  const imagen
  const imagenMenu
  var tiempo = 20
  const danoAlumno
  var property sube = null


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
  method sueno() = sueno
  method tiempo() = tiempo

  method agregarTiempo(cantidad) {
    tiempo += cantidad
  }

  method consumirTiempo(cantidad) {
    tiempo= (tiempo-cantidad).max(0)
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

  method tieneSube() = sube != null

  method saldo() = if (self.tieneSube()) sube.saldo() else 0

  method asignarSube(unaSube) {
    sube = unaSube
  }

  method pagar(monto) {
    self.pierdeDinero(monto)
  }

  method aumentarSueno(cantidad) {
    sueno = (sueno + cantidad).min(100)
  }

  method reducirSueno(cantidad) {
    sueno = (sueno - cantidad).max(0)
  }

  method subirAlBondi() = self.saldo() >= bondi.precioBoleto()

  method disparar() {
    const bala = new Bala(position = position.right(1), dano = danoAlumno)
    bala.disparar()
  }

  method recibirDano(cantidad) {}

}


const lucio    = new Alumno(imagenMenu = "lucio_menu.png", imagen = "lucio.png", dinero = 500, tiempo = 70, danoAlumno=13)
const lari     = new Alumno(imagenMenu = "lari_menu.png", imagen = "lari.png", dinero = 1000, tiempo = 60, danoAlumno=9)
const solci    = new Alumno(imagenMenu = "solci_menu.png", imagen = "solci.png", dinero = 900, tiempo = 80, danoAlumno=12)
const alvarez  = new Alumno(imagenMenu = "AlvarezMenu.png", imagen = "AlvarezJuego.png", dinero = 0, tiempo = 60, danoAlumno=18)
const salva    = new Alumno(imagenMenu = "salvaMenu.png", imagen = "salva.png", dinero = 12, tiempo = 74 , danoAlumno=12)

object juego {
  var property jugador = lucio
  var property nivelActual = null
  var property estadoPantalla = "menu"
}