import 'package:animated_list/fruits.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Fruits> fruits = [
    Fruits("Apple",
        "https://cdn.pixabay.com/photo/2017/01/17/12/14/apple-1986660_960_720.png"),
    Fruits("Grapes",
        "https://w7.pngwing.com/pngs/881/12/png-transparent-grape-fruit-raceme-a-bunch-of-grapes-purple-food-blueberry-thumbnail.png"),
    Fruits("Pear",
        "https://www.pngall.com/wp-content/uploads/2016/04/Pear-PNG-Pic.png"),
    Fruits("Orange",
        "https://www.nicepng.com/png/detail/923-9237061_orange-naranja-orange-slide-middle-media-naranja-png.png")
  ];

  final listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: AnimatedList(
            key: listKey,
            initialItemCount: fruits.length,
            itemBuilder: (context, index, animation) {

              // ListTile con la fruta y el nombre y para borrarla
              return SizeTransition(
                key: ValueKey(fruits[index].getImage),
                sizeFactor: animation,
                child: Fruit_TileList(fruits[index], index, animation),
              );

            }),
      ),

        floatingActionButton: FloatingActionButton(
          onPressed: insertItem,
          child: Icon(Icons.ac_unit),
        ),
      );
    }


  SizeTransition Fruit_TileList(Fruits fruit, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: GestureDetector(
        onTap: (){
          removeANDinsertBACK(index);
        },
        child: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(fruit.getImage),
                
              ),
              title: Text(fruit.getName.toString()),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red[600],),
                onPressed: () => removeItem(index),
              ),
            )),
      ),
    );
  }


  void removeItem(int index) {
    final fruta = fruits[index];
    fruits.removeAt(index);
    listKey.currentState!.removeItem(
        index, (context, animation) => Fruit_TileList(fruta, index, animation),
        duration: Duration(milliseconds: 400)
    );
  }


  void insertItem() {
    final newIndex = fruits.length;
    final papaya = (List.of(fruits)..shuffle()).first;
    fruits.insert(newIndex, papaya);
    listKey.currentState!
        .insertItem(newIndex, duration: Duration(milliseconds: 400));
  }

  // Quita del principio y luego lo inserta en el final
  void removeANDinsert(int i){
    // eliminarlo
    Fruits fruta = fruits[i];
    fruits.removeAt(i);
    listKey.currentState!.removeItem(
        i, (context, animation) => Fruit_TileList(fruta, i, animation),
        duration: Duration(milliseconds: 400)
    );
    // insertarlo en la parte de abajo
    final newIndex = fruits.length;
    fruits.insert(newIndex, fruta);
    listKey.currentState!
        .insertItem(newIndex, duration: Duration(milliseconds: 400));
  }

  // Quita del final y luego lo inserta en el principio
  void removeANDinsertBACK(int i){
    // eliminarlo
    Fruits fruta = fruits[i];
    fruits.removeAt(i);
    listKey.currentState!.removeItem(
        i, (context, animation) => Fruit_TileList(fruta, i, animation),
        duration: Duration(milliseconds: 400)
    );
    // insertarlo en la parte de abajo
    fruits.insert(0, fruta);
    listKey.currentState!
        .insertItem(0, duration: Duration(milliseconds: 400));
  }
}
