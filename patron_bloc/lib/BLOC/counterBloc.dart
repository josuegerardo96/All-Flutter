import 'dart:async';
import 'package:patron_bloc/BLOC/counterRepository.dart';


class CounterBase{}
class IncrementCounter extends CounterBase{}
class ClearCounter extends CounterBase{}
class FetchCounter extends CounterBase{}

class counterBloc {
  CounterRepository counterRepository = CounterRepository();

  StreamController<CounterBase> _input = StreamController();
  StreamController<int> _output = StreamController();

  Stream<int> get counterStream => _output.stream;
  StreamSink<CounterBase> get sendEvent => _input.sink;



  counterBloc() {
    _input.stream.listen(_onEvent);
  }

  void dispose(){
    _input.close();
    _output.close();
  }

  void _onEvent(CounterBase event){
    if(event is IncrementCounter){
      counterRepository.increment();
    }else if(event is ClearCounter){
      counterRepository.clear();
    }

    _output.add(counterRepository.get());
  }



}
