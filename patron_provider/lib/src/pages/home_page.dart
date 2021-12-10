import 'package:flutter/material.dart';
import 'package:patron_provider/src/widgets/super_floating.dart';
import 'package:patron_provider/src/widgets/super_text.dart';
import 'package:provider/provider.dart';
import 'package:patron_provider/src/providers/heroesinfo.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

  @override
  Widget build(BuildContext context) {

    final heroesInfo = Provider.of<HeroesInfo>(context);


    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text(heroesInfo.heroe)),
      ),



      body: Center(
        child: superText()
      ),
      

      floatingActionButton: superFloating(),


    );
  }
}