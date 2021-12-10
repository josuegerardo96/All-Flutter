class CounterRepository{

  int _count = 0;


  int get(){
    return _count;
  }


  void increment(){
    _count++;
  }


  void clear(){
    _count = 0;
  }


  void double(){
    _count *= 2;
  }


}