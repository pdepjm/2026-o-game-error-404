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

    const tiempoEsperaTransicion = 1500

    method interactuar(personaje) {
        if (personaje.subirAlBondi()) {
            game.say(self, "Te alcanza, subite")
            game.schedule(tiempoEsperaTransicion, {
                nivel1.finalizarCon(pantallaGanaste)
                juego.estadoPantalla("pasarNivel2")

                keyboard.enter().onPressDo({
                    nivel2.iniciar()
                })
            })
        } else {
            game.say(self, "No llegas, bajate que la gente está yendo al trabajo pibe")
            game.schedule(tiempoEsperaTransicion, {
                nivel1.finalizarCon(pantallaSinSaldo)
                juego.estadoPantalla("volverMenu")
            })
        }
    }
    
}