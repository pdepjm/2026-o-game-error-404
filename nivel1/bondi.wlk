import wollok.game.*
import alumno.*
import nivel1.*
import nivel2.nivel2.*
import interfaz.pantallas.*

object bondi {
    const precioBoleto = 670

    method precioBoleto() = precioBoleto
    method image() = "bondi.png"
    var property position = game.at(20, 0)

    method aparecer() {
        game.addVisual(self)
        juego.jugador().agregarTiempo(15)
        game.say(self, "¡Llegó el bondi! Tenés 15 segundos para subirte")
    }

    method interactuar(personaje) {
        if (personaje.subirAlBondi()) {
            game.say(self, "Te alcanza, subite")
            game.schedule(1500, {
                nivel2.iniciar()
            })
        } else {
            game.say(self, "No llegas, bajate que la gente está yendo al trabajo pibe")
            game.schedule(1500, {
            game.clear()
            game.addVisual(pantallaSinSaldo)})
        }
    }
}