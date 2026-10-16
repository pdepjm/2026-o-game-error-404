import wollok.game.*
import alumno.*

object plata {
    method position() = game.at(1, 13)
    method text() = "Plata: " + juego.jugador().dinero().toString()
    method textColor() = "FFFFFFFF"
    method interactuar(personaje) {}
}

object saldo {
    method position() = game.at(1, 12)
    method text() = "Saldo: " + juego.jugador().saldo().toString()
    method textColor() = "FFFFFFFF"
    method interactuar(personaje) {}
}

object suenoVisual {
    method position() = game.at(1, 13)
    method text() = "Sueño: " + juego.jugador().sueno().toString() + "/100"
    method textColor() = "FFFFFFFF"
    method interactuar(personaje) {}
}