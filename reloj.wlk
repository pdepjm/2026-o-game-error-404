import alumno.*

object reloj{
    method position() = game.at(1, 14)
    method text() = "Tiempo: " + alumno.tiempo().toString()
    method textColor() = "FFFFFFFF"
}