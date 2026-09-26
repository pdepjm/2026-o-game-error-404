import wollok.game.*
import efectos.*

object fisura{
    method image() = "fisura.png"
    var property position = game.at(10, 3)

    method interactuar(personaje){
        game.say(self, "Eh wacho dame todo")
        robo.aplicarEfecto(personaje)
        game.removeVisual(self)
    }

}

object vecino{
    method image() = "vecino.png"
    var property position = game.at(3, 8)

    method interactuar(personaje){
        game.say(self, "Tomá, un café")
        cafe.aplicarEfecto(personaje)
        game.removeVisual(self)
    }
}

object policia{
    method image() = "policia.png"
    var property position = game.at(9, 6)

    method interactuar(personaje){
        game.say(self, "A ver mostrame los documentos")
        frenar.aplicarEfecto(personaje)
        game.removeVisual(self)
    }
}


object kiosco {
    var property position = game.at(0, 8)
    method image() = "kiosco.png"
    method interactuar(personaje) {
        game.say(self, "Te cargo 500")
        personaje.cargarSube(500)
    }
}

