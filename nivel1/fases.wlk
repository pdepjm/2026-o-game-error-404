import alumno.*
import bondi.*
import nivel1.*
import interfaz.pantallas.*

object faseEsperandoBondi {
    method pasarSegundo() {
        const jugador = juego.jugador()
        jugador.pasarSegundo()

        if(jugador.tiempo() == 0) {
            bondi.aparecer()
            nivel1.cambiarFase(faseLlegoBondi)
            jugador.tiempo(15)
        }
    }
}

object faseLlegoBondi {
    method pasarSegundo() {
        const jugador = juego.jugador()
        jugador.pasarSegundo()

        if(jugador.tiempo() == 0) {
            nivel1.terminarPorTiempo()
             keyboard.enter().onPressDo({
            menuPrincipal.mostrar()
    })
        }
    }
}