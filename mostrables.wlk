import wollok.game.*
import alumno.*

object reloj{
    method position() = game.at(1, 14)
    method text() = "Tiempo: " + juego.jugador().tiempo().toString()
    method textColor() = "FFFFFFFF"
    method interactuar(personaje){}
}

object plata{
    method position() = game.at(1, 13)
    method text() = "Plata: " + juego.jugador().dinero().toString()
    method textColor() = "FFFFFFFF"
    method interactuar(personaje){}
}

object saldo{
    method position() = game.at(1, 12)
    method text() = "Saldo: " + juego.jugador().saldo().toString()
    method textColor() = "FFFFFFFF"
    method interactuar(personaje){}
}
