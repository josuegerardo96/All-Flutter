
import 'dart:async';

import 'package:patron_bloc/BLOC/counterBloc.dart';
import 'package:patron_bloc/BLOC/counterRepository.dart';

class DoubleBase{}

class DoubleEvent extends DoubleBase{}
class ClearEvent extends DoubleBase{}
class FetchEvent extends DoubleBase{}

class DoubleBloc{

  CounterRepository counterRepository = CounterRepository();

  StreamController<DoubleBase> _input = StreamController();
  StreamController<int> _output = StreamController();

  Stream<int> get counterStream => _output.stream;
  StreamSink<DoubleBase> get sendEvent => _input.sink;


  DoubleBloc(){
    _input.stream.listen(_onEvent);
  }



  void dispose(){
    _input.close();
    _output.close();
  }



  void _onEvent(DoubleBase event){
    
    if( event is DoubleEvent){
      counterRepository.increment();

    }else if(event is ClearEvent){
      counterRepository.clear();
    }

    _output.add(counterRepository.get());
  }



}