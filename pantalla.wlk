import wollok.game.*
import alumno.*

object reloj{
    method position() = game.at(1, 14)
    method text() = "Tiempo: " + alumno.tiempo().toString()
    method textColor() = "FFFFFFFF"
    method interactuar(personaje){}
}

object plata{
    method position() = game.at(1, 13)
    method text() = "Plata: " + alumno.dinero().toString()
    method textColor() = "FFFFFFFF"
    method interactuar(personaje){}
}
