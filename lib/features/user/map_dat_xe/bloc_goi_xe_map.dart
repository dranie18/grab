import 'dart:async';

import '../../../bloc_base.dart';

class BlocGoiXeMap extends BlocBase {
  StreamController streamListController = StreamController.broadcast();
  @override
  void dispose() {
    if (!streamListController.isClosed) streamListController.close();
  }

  void upDatepolylines(list) {
    streamListController.sink.add(list);
  }

  @override
  Sink getSink() {
    // TODO: implement getSink
    return streamListController.sink;
  }

  @override
  Stream getStream() {
    // TODO: implement getStream
    return streamListController.stream;
  }
}
