import 'dart:async';

List<String> PRODUCTOS = ['spider','naruto','goku','batman'];


class ProductosBloc {

  // En el constructor se manda a llamar el stream que tiene la cantidad de productos
  ProductosBloc() {
    cantidadProductos();
  }

  // Se crea un stream de enteros (para la cantidad de productos)
  StreamController<int> _productosContador = new StreamController<int>();

  // Se manda a llamar este get cuando se quiere obtener el stream del contador
  Stream<int> get getProductosContador => _productosContador.stream;

  
  // En este stream fluye una LISTA de strings
  // yield es la forma de devolver un stream
  Stream<List<String>> get getProductos async* {
      yield PRODUCTOS;
  }


  // Así se remueve un producto (no restrictions) y se actualiza el stream
  void removeProducto(int i){
    PRODUCTOS.removeAt(i);
    this._productosContador.add(PRODUCTOS.length);
    print(PRODUCTOS.toString());
  }


  
  void cantidadProductos(){
    // Así se obtiene info de un stream
    this.getProductos.listen((productosList) {
      this._productosContador.add(productosList.length);
    });
  }


  // cuando todo muere entonces se cierra el stream
  dispose() {
    _productosContador.close();
  }
}
