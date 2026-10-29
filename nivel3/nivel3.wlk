/*
import nivel1.consumibles.*
import wollok.game.*
import alumno.*
import nivel2.mobsNivel2.*
import nivel2.consumiblesNivel2.*
import interfaz.mostrables.*
import interfaz.pantallas.*
import nivel1.nivel1.*
import efectos.*
import controles.*

*/
/* ¡Llegaste a la facultad, pero todavía falta encontrar dónde rendís!

Recolectá tu legajo para averiguar en qué comisión estás.

Pasá por Bedelía para conseguir la información que necesitás.

Encontrá tu DNI, la hoja de fórmulas y los útiles necesarios para rendir.

¡Conseguí todo lo necesario y encontrá el aula correcta!

¿Estás listo para rendir? ¡Movete rápido, esquivá los obstáculos y no te olvides de nada!*/


/*
object nivel3{ 
  var finalizado = false

  method iniciar() {
    juego.nivelActual(self)
    finalizado = false

    game.clear()

    const jugador = juego.jugador()
    jugador.position(game.at(1, 7))

    game.addVisual(pantallaNivel3)
    game.addVisual(jugador)

    game.addVisual(legajo)
    game.addVisual(sube)
    game.addVisual(hojaFormulas)
    game.addVisual(utiles)

    game.onTick(500, "moverObstaculos", {
      legajo.moverse(4, 10)
      dni.moverse(4, 10)
      hojaFormulas.moverse(4, 10)
      utiles.moverse(4, 10)
    })

    controles.keyboardControls(jugador)

    game.onCollideDo(jugador, { objetoChocado => objetoChocado.interactuar(jugador) })

  }

  method pasarSegundo() {}
 
}
*/