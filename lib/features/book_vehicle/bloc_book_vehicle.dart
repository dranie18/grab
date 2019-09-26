import 'dart:async';

class BlocBookVechicle {
  StreamController streamListController = StreamController.broadcast();
// sink
  Sink get bookSink => streamListController.sink;
// stream
  Stream get bookStream => streamListController.stream;

// function to change the color
  changeCamera(value) {
    bookSink.add(value);
  }
}
