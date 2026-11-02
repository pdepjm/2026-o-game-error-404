import wollok.game.*
import nivel1.bondi.*
import nivel1.consumibles.*
import nivel2.balas.*

class Alumno {
  const dineroInicial
  var dinero = dineroInicial
  var sueno = 0
  const imagen
  const imagenMenu
  const tiempoInicial = 20
  var tiempo = tiempoInicial
  const danoAlumno
  var property sube = null

  method dinero() = dinero
  method sueno() = sueno
  method tiempo() = tiempo
  method danoAlumno() = danoAlumno

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

  method reiniciar() {
    dinero = dineroInicial
    tiempo = tiempoInicial
    sueno = 0
    sube = null
    position = game.at(0, 0)
  }

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


const lucio   = new Alumno(imagenMenu = "lucio_menu.png", imagen = "lucio.png", dineroInicial = 500, tiempoInicial = 70, danoAlumno = 13)
const lari    = new Alumno(imagenMenu = "lari_menu.png", imagen = "lari.png", dineroInicial = 1000, tiempoInicial = 60, danoAlumno = 9)
const solci   = new Alumno(imagenMenu = "solci_menu.png", imagen = "solci.png", dineroInicial = 900, tiempoInicial = 80, danoAlumno = 12)
const alvarez = new Alumno(imagenMenu = "AlvarezMenu.png", imagen = "AlvarezJuego.png", dineroInicial = 0, tiempoInicial = 60, danoAlumno = 18)
const salva   = new Alumno(imagenMenu = "salvaMenu.png", imagen = "salva.png", dineroInicial = 12, tiempoInicial = 74, danoAlumno = 12)

object juego {
  var property jugador = lucio
  var property nivelActual = null
  var property estadoPantalla = "menu"
}