import 'dart:async';
import 'package:streams_tareas/widget/tarea.dart';


class CounterStream {
  final _controler = StreamController<List<Tarea>>();

  Stream<List<Tarea>> get counterStream => _controler.stream;
  
   void startCounter(List<Tarea> m) {
    _controler.sink.add(m);
  }
  void dispose(){
    _controler.close();
  }
}




