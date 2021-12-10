import 'package:bloc_yield_async_streams/bloc/productos_bloc.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(
    new MaterialApp(
     home: main_screen(),
     debugShowCheckedModeBanner: false,
    )
  );
}



class main_screen extends StatefulWidget {
  

  @override
  _main_screenState createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {

  
  final productosBloc = new ProductosBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Center(

          // Mediante un streamBuilder se verifica cuantos productos hay
          child: StreamBuilder(
            // Un stream
            stream: productosBloc.getProductosContador,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              // Si tiene null entonces se le asigna 0
              return Text("Productos ${snapshot.data ?? 0}");
            }),
        )
        
      ),


      body: SafeArea(
        child: StreamBuilder(

          stream: productosBloc.getProductos,



          builder: (BuildContext context, AsyncSnapshot<List<String>>snapshot){

            
            final productos = snapshot.data ?? [];


            return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (BuildContext context, int i){
                return ListTile(
                  title: Text(productos[i]),
                );
              },
            );



          },
          
        )
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.flash_on),
        onPressed: (){
          
          setState(() {
            productosBloc.removeProducto(0);
          });
      }),



    );
  }
}