import 'package:flutter/material.dart';
import 'package:patron_provider/src/providers/heroesinfo.dart';
import 'package:patron_provider/src/providers/villanoinfo.dart';
import 'package:provider/provider.dart';



class superFloating extends StatelessWidget {
  const superFloating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final heroeInfo = Provider.of<HeroesInfo>(context);
    final villanoInfo = Provider.of<VillanosInfo>(context);

    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [


          FloatingActionButton(
            onPressed: (){
              heroeInfo.heroe = 'Iron Man';
              villanoInfo.villano = 'El mandarinas';
            },
            child: Icon(Icons.map),
            backgroundColor: Colors.red,
          ),

          SizedBox(height: 10.0,),


          FloatingActionButton(
            onPressed: (){
              heroeInfo.heroe = 'Gokuuuu';
              villanoInfo.villano = 'Freezer';
            },
            child: Icon(Icons.add),
          )

        ],
      );
  }
}