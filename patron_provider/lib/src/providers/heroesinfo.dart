import 'package:flutter/material.dart';


// Usar ChangeNotifier es para las notificaciones
class HeroesInfo with ChangeNotifier {

  
  String _heroe = 'Capitán América';
  Color colorBase = Colors.blue;


  String get heroe {
    return _heroe;
  }

  set heroe(String nombre) {
    this._heroe = nombre;
    if (nombre == 'Iron Man') {
      this.colorBase = Colors.red;
    } else {
      this.colorBase = Colors.blue;
    }
    
    // Cada vez que esto se ejecute, avise a todos los 
    // interesados que esto cambió
    notifyListeners();
  }
}
