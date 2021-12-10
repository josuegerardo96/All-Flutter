import 'package:flutter/material.dart';
import 'package:patron_provider/src/pages/home_page.dart';
import 'package:patron_provider/src/providers/heroesinfo.dart';
import 'package:patron_provider/src/providers/villanoinfo.dart';
import 'package:provider/provider.dart';


void main(){runApp(MyApp());}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    

    // Se usa multiProvider porque hay que usar muchos
    return MultiProvider(
      // Crea una instancia de los heroes y villanos
      providers: [
        ChangeNotifierProvider<HeroesInfo>(create: (context)=> HeroesInfo()),
        ChangeNotifierProvider<VillanosInfo>(create: (context)=> VillanosInfo()),
      ],
      

      child: MaterialApp(
        initialRoute: 'home',
        routes: {
          'home': (context) => HomePage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );



  }
}
