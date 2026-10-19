import wollok.game.*

class Bala {
  var property position
  const dano 
  var activa = true

  method image() = "bala.png"

  method disparar() {
    game.addVisual(self)
    game.onCollideDo(self, { objetoChocado => self.impactar(objetoChocado)})
    self.avanzar()
  }

  method avanzar() {
    if (activa and position.x() < 28) {
      game.schedule(10, {
        if (activa) {
          position = position.right(1)
          self.avanzar()
        }
      })
    } else if (activa) {
      self.destruir()
    }
  }

  method impactar(objetivo) {
    if (activa) {
      self.destruir()
      objetivo.recibirDano(dano)
    }
  }

  method destruir() {
    if (activa) {
      activa = false
      game.removeVisual(self)
    }
  }

  method interactuar(personaje) {}
  method recibirDano(cantidad) {}
}