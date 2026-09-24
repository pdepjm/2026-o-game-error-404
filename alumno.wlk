object alumno {
  var tiempo = 200
  var dinero = 0
  var tieneSube = false
  var saldo = 0

  var position = game.at(0,0)
  method image() = "imagenes/alumno.gif"

  method position() = position
  method mover(nuevaPosicion){
    if(tiempo>0){
      position = nuevaPosicion
      self.consumirTiempo(1)
      if(tiempo==0){
        game.stop()
      }
    } 
  }

  method consumirTiempo(perdida){
    tiempo-=perdida
  }

  method tiempo() = tiempo

  method dinero() = dinero

  method saldo() = saldo

  method tieneSube() = tieneSube

  method conseguirDinero(cantidad) {
    dinero += cantidad
  }

  method pierdeDinero(cantidadPerdida) {
    dinero -= cantidadPerdida
  }

  method conseguirSube(subeEncontrada) {
    saldo += subeEncontrada.saldo()
    tieneSube = true
  }

  method cargarSube(carga) {
    if (tieneSube && dinero >= carga) {
      dinero = dinero - carga
      saldo+=carga
    }
  }

  method restarTiempo(cantidad) {
    tiempo = tiempo - cantidad
  }

  method agregarTiempo(cantidad) {
    tiempo = tiempo + cantidad
  }

  method subirAlBondi() = saldo>=bondi.precioBoleto()

}
