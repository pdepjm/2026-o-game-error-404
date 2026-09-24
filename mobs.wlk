import wollok.game.*
import efectos.*

object fisura{
    method image() = "imagenes/fisura.png"
    var property position = game.at(10, 3)

    method interactuar(personaje){
        robo.aplicarEfecto(personaje)
        game.removeVisual(self)
    }
}

object vecino{
    method image() = "imagenes/vecino.png"
    var property position = game.at(3, 8)

    method interactuar(personaje){
        cafe.aplicarEfecto(personaje)
        game.removeVisual(self)
    }
}

object kiosco {
    var property position = game.at(0, 8)
    method image() = "imagenes/kiosco.png"
    method interactuar(personaje) {
        personaje.cargarSube(500)
    }
}

