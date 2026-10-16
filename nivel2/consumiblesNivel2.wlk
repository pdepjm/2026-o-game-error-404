import wollok.game.*
import alumno.*

class ConsumibleSueno {
    const reduccionSueno
    const imagen

    var property position = game.at(0, 0)

    method image() = imagen

    method interactuar(personaje) {
        personaje.reducirSueno(reduccionSueno)
        game.removeVisual(self)
    }
}

const monster = new ConsumibleSueno(
    reduccionSueno = 35,
    imagen = "monster.png",
    position = game.at(3, 8)
)

const gomitas = new ConsumibleSueno(
    reduccionSueno = 15,
    imagen = "gomitas.png",
    position = game.at(14, 9)
)

const gomitas2 = new ConsumibleSueno(
    reduccionSueno = 15,
    imagen = "gomitas.png",
    position = (game.at(24, 5))
)