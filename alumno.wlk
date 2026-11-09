import wollok.game.*
import nivel1.bondi.*
import nivel1.consumibles.*
import nivel1.nivel1.*
import nivel2.balas.*
import estados.*

class Alumno {
  const dineroInicial
  var dinero = dineroInicial
  var sueno = 0
  const imagen
  const imagenMenu
  const tiempoInicial = 20
  var tiempo = tiempoInicial
  const danoAlumno
  var property sube = sinSube

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
    sube = sinSube
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

  method tieneSube() = sube.tieneSube()

  method saldo() = sube.saldo()

  method asignarSube(unaSube) {
    sube = unaSube
  }

  method cargarSube(monto) {
    sube.cargar(monto)
  }

  method pagar(monto) {
    self.pierdeDinero(monto)
  }

  method aumentarSueno(cantidad) {
    sueno = (sueno + cantidad).min(50)
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


const lucio   = new Alumno(imagenMenu = "lucio_menu.gif", imagen = "lucio.png", dineroInicial = 500, tiempoInicial = 70, danoAlumno = 13)
const lari    = new Alumno(imagenMenu = "lari_menu.gif", imagen = "lari.png", dineroInicial = 1000, tiempoInicial = 60, danoAlumno = 9)
const solci   = new Alumno(imagenMenu = "solci_menu.gif", imagen = "solci.png", dineroInicial = 900, tiempoInicial = 80, danoAlumno = 12)
const alvarez = new Alumno(imagenMenu = "AlvarezMenu.gif", imagen = "AlvarezJuego.png", dineroInicial = 0, tiempoInicial = 60, danoAlumno = 18)
const salva   = new Alumno(imagenMenu = "salvaMenu.gif", imagen = "salva.png", dineroInicial = 12, tiempoInicial = 74, danoAlumno = 12)

object juego {
  var property jugador = lucio
  var property estadoActual = estadoMenu
  var property nivelActual= nivel1
  var property puedeReiniciarNivel = false

  method cambiarEstado(nuevoEstado) {
    estadoActual = nuevoEstado
    estadoActual.activar()
  }

   method reiniciarNivel() {
  if (puedeReiniciarNivel) {
    puedeReiniciarNivel = false
    self.jugador().reiniciar()
    nivelActual.iniciar()
  }
}
}