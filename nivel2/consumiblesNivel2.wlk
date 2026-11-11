import wollok.game.*
import consumible.*
import alumno.*
import sonidos.*
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
    position = game.at(24, 5)
)

const gomitas = new ConsumibleSueno(
    reduccionSueno = 15,
    imagen = "gomitas.png",
    position = game.at(14, 9)
)



class Cancion inherits ConsumibleSueno {
    override method aplicarEfecto(personaje) {
        super(personaje)
        sonidos.cancion()
    }
}
const cancion = new Cancion(
    reduccionSueno = 20,
    imagen = "cancion.png",
    position = game.at(3, 8)
)