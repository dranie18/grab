import 'dart:async';

import '../../../bloc_base.dart';

class BlocBookVechicle implements BlocBase {
  StreamController streamListController = StreamController.broadcast();

// sink
  var bookSink;

// function to change the color
  upDateData(value) {
    streamListController.sink
        .add({"check": value["check"], "value": value["value"]});
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
