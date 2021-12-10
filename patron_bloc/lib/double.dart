import 'package:flutter/material.dart';
import 'package:patron_bloc/BLOC/doubleBloc.dart';
import 'package:patron_bloc/main.dart';





class my_screen_double extends StatefulWidget {


  @override
  _my_screen_doubleState createState() => _my_screen_doubleState();
}

class _my_screen_doubleState extends State<my_screen_double> {

  
  DoubleBloc _bloc = new DoubleBloc();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.sendEvent.add(FetchEvent());
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){return my_screen();}));
            },
            child: Icon(Icons.splitscreen, color: Colors.white))
          
        ],
      ),


      body: Container(


        child: Center(


          child: StreamBuilder(
            stream: _bloc.counterStream,
            initialData: 0,
            builder:(BuildContext context, AsyncSnapshot<int> snapshot){ 
              return Text(
                "How many clicks you have done: \n\n ${snapshot.data}",
                textAlign: TextAlign.center,

              
              );
            }
          ) 
        ),
      ),


      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [


          FloatingActionButton(
            heroTag: "1",
            onPressed: (){
              setState(() {


                _bloc.sendEvent.add(ClearEvent()); 


              });
            }, 
            
            child: Icon(Icons.exposure_zero)),

          SizedBox(width: 20.0),


          FloatingActionButton(
            heroTag: "2",
            onPressed:() {
              setState(() {
               _bloc.sendEvent.add(DoubleEvent());


              });
            },

            child: Icon(Icons.add),
          ),

        ]
      ),

      

    );
  }
}