// ignore_for_file: unused_local_variable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:future_builder/models/request_model.dart';
import 'package:http/http.dart' as http;


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
  @override
  Widget build(BuildContext context) {
    return miPagina();
  }
}


Future<ReqResRespuesta> getUsuarios() async {
  // Se mapea la respuesta
  final resp = await http.get(Uri.parse('https://reqres.in/api/users'));

  // Se obtiene la respuesta en modo de objeto
  return reqResRespuestaFromJson(resp.body); 

}



class miPagina extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(


        // Aquí se usa el FutureBuilder
        // Es cómo un stream pero que espera información en proceso
        child: FutureBuilder(
          future: getUsuarios(),
          builder: (BuildContext context, AsyncSnapshot<ReqResRespuesta> snapshot){
          
            // Se analiza si está esperando
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{

              // Si no está esperando entonces se crea el ListView de los usuarios
              // snapshot.data tiene toda la información del objeto, el otro .data 
              // es nada más información dentro del objeto pero eso es cuestión del ejemplo
              return _ListaUsuarios(snapshot.data!.data );
            }
          }

        )
      )


    );
  }
}

class _ListaUsuarios extends StatelessWidget {

  // esto viene del objeto dentro de la clase que se creo
  // para las varas JSON obtenidas en el HTTP
  final List<Usuario> usuarios;
  _ListaUsuarios(this.usuarios);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: usuarios.length,
      itemBuilder: (BuildContext context, int i){
        final usuario = usuarios[i];
        return FadeInLeft(
          delay: Duration(milliseconds: 100*i),
          child: ListTile(
            title: Text('${ usuario.firstName } ${usuario.lastName}'),
            subtitle: Text('${usuario.email}'),
            trailing: Image.network(usuario.avatar),
        
          ),
        );
      }
    );

  }



}