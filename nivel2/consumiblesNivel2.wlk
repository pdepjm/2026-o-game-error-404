import wollok.game.*
import consumible.*
import alumno.*

class ConsumibleSueno inherits Consumible 
{
    const reduccionSueno
   
    override method aplicarEfecto(personaje)
    {
        personaje.reducirSueno(reduccionSueno)
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