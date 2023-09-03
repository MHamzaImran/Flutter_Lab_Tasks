import 'dart:async';
// Creating a number stream

class NumberStream {
  StreamController<int> controller = StreamController<int>();

  addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  addError() {
    controller.sink.addError('error');
  }
}

