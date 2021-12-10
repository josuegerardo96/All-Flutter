import 'package:flutter/material.dart';
import 'package:patron_bloc/BLOC/counterBloc.dart';
import 'package:patron_bloc/BLOC/doubleBloc.dart';
import 'package:patron_bloc/double.dart';



void main(){
  runApp(
    MaterialApp(
      home: my_screen(),
      debugShowCheckedModeBanner: false,
    )
  );
}



class my_screen extends StatefulWidget {


  @override
  _my_screenState createState() => _my_screenState();
}

class _my_screenState extends State<my_screen> {

  counterBloc _bloc = counterBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }



  //int counter = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text("Hello"),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              Navigator.
              of(context).
              push(MaterialPageRoute(
                builder: (BuildContext context){
                  return my_screen_double();
                })).then((_){_bloc.sendEvent.add(FetchCounter());});
            }, 
            child: Icon(Icons.trending_up, color: Colors.white,))
        ],
      ),


      body: Container(


        child: Center(


          child: StreamBuilder(
            stream:_bloc.counterStream,
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

                //counter=0;
                _bloc.sendEvent.add(ClearCounter()); 

              });
            }, 
            
            child: Icon(Icons.exposure_zero)),

          SizedBox(width: 20.0),


          FloatingActionButton(
            heroTag: "2",
            onPressed:() {
              setState(() {
                _bloc.sendEvent.add(IncrementCounter());
                //counter++;

              });
            },

            child: Icon(Icons.add),
          ),

        ]
      ),

      

    );
  }
}