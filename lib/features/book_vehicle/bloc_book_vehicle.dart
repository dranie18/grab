import 'dart:async';

import '../../bloc_base.dart';

class BlocBookVechicle implements BlocBase {
  StreamController streamListController = StreamController.broadcast();
// sink
  var bookSink;

// function to change the color
  changeCamera(value) {
    streamListController.sink.add(value);
  }

  @override
  Sink getSink() {
    return streamListController.sink;
  }

  @override
  Stream getStream() {
    return streamListController.stream;
  }

  @override
  void dispose() {
    streamListController.close();
  }
}
