object alumno {
  var tiempo = 60
  var dinero = 0
  var tieneSube = false
  var subeCargada = false

  method tiempo() = tiempo

  method dinero() = dinero

  method tieneSube() = tieneSube

  method subeCargada() = subeCargada

  method conseguirDinero(cantidad) {
    dinero = dinero + cantidad
  }

  method conseguirSube() {
    tieneSube = true
  }

  method cargarSube(costo) {
    if (tieneSube && dinero >= costo) {
      dinero = dinero - costo
      subeCargada = true
    }
  }

  method restarTiempo(cantidad) {
    tiempo = tiempo - cantidad
  }

  method agregarTiempo(cantidad) {
    tiempo = tiempo + cantidad
  }
}