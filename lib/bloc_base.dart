import 'dart:async';

abstract class BlocBase {
  Sink getSink();
  Stream getStream();
  void dispose();
}
