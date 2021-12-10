import 'package:flutter/material.dart';


// Usar ChangeNotifier es para las notificaciones
class VillanosInfo with ChangeNotifier {

  
  String _villano = 'Red Skull';
  Color colorBase = Colors.blue;


  String get villano {
    return _villano;
  }

  set villano(String nombre) {
    this._villano = nombre;
    
    // Cada vez que esto se ejecute, avise a todos los 
    // interesados que esto cambió
    notifyListeners();
  }
}
