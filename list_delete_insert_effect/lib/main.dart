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
  final List<String> items = ['pollo','salchicha','arroz','spaguetti','salchcihon','naruto'];


  @override
  _main_screenState createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {


  // Lleva el control de que es lo que se borra
  final GlobalKey<AnimatedListState> _key = GlobalKey();




  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(

      body: SafeArea(

        // Se usa animatedList
        child: AnimatedList(
          // Asignarle la llave
          key: _key,
          initialItemCount: widget.items.length,
          itemBuilder: (context, index, animation){
            // Se manda a llamar la función que crea los widgets de la lista uno x uno
            return _buildItem(widget.items[index], animation, index);
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),

        // insertar elemento
        onPressed: () => _addItem(),

      ),




        
    );
      

    
  }

  // Función que inserta el elemento
  void _addItem(){
    int i = widget.items.length > 0 ? widget.items.length : 0;
    widget.items.insert(i, 'El valor a insertar va aquí ${i}');
    // Actualizar el estado de las llaves 
    _key.currentState!.insertItem(i);
  }



  // devuelve el 1x1 de elementos de la lista
  Widget _buildItem(String item, Animation<double> animation, int index){

    return SizeTransition(
      sizeFactor: animation,
      

      // Se hace la parte de vista
      child: Card(
        elevation: 2,
        child: ListTile(
          title: Text(
            item,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),

          ),
          subtitle: Text("lorem ipsum..."),
          leading: CircleAvatar(backgroundColor: Colors.amber,),
          trailing: IconButton(
            icon: Icon(Icons.close, color: Colors.redAccent,),

            // llama a la función que borra la vara
            onPressed: (){_removeItem(index);},
          ),

        ),
      ),
    );



  }


  // Función que borra la vara
  void _removeItem(int i){

    String removedItem = widget.items.removeAt(i);
    AnimatedListRemovedItemBuilder builder = (context, animation){

      // Llama la función que crea 1x1 los elementos
      return _buildItem(removedItem, animation, i);
    };

    // Se actualizan las llaves globales que llevan el control de los elementos
    _key.currentState!.removeItem(i, builder);
  }
}

