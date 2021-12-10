import 'package:flutter/material.dart';
import 'package:patron_provider/src/providers/heroesinfo.dart';
import 'package:patron_provider/src/providers/villanoinfo.dart';
import 'package:provider/provider.dart';



class superText extends StatelessWidget {
  const superText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final heroesInfo = Provider.of<HeroesInfo>(context);
    final villanoInfo = Provider.of<VillanosInfo>(context);
    
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(heroesInfo.heroe, style: TextStyle(fontSize: 30.0, color: heroesInfo.colorBase),),
        Text(villanoInfo.villano, style: TextStyle(fontSize: 20.0),),
        
      ],
    );
  }
}