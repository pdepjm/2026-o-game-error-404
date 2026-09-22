object semaforo {
  method aplicarEfecto(alumno) {
    alumno.restarTiempo(5)
  }
}

object lluvia {
  method aplicarEfecto(alumno) {
    alumno.restarTiempo(10)
  }

}

object cafe {
  method aplicarEfecto(alumno) {
    alumno.agregarTiempo(5)
  }
}
