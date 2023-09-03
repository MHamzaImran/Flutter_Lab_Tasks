import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'number_generator.dart';

class Lab12Task2 extends StatefulWidget {
  const Lab12Task2({Key? key}) : super(key: key);

  @override
  Lab12Task2State createState() => Lab12Task2State();
}

class Lab12Task2State extends State<Lab12Task2> {
  int? lastNumber;
  late StreamController<int> numberStreamController;
  late NumberStream numberStream;
  late StreamSubscription<int> subscription;

  @override
  void initState() {
    super.initState();
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream<int> stream = numberStreamController.stream;
    subscription = stream.listen(
      (event) {
        setState(() {
          lastNumber = event;
        });
      },
      onError: (error) {
        setState(() {
          lastNumber = -1;
        });
      },
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    numberStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 12: Task 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${lastNumber ?? ""}',
              style: const TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () => addRandomNumber(),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, // Set the text color of the button
                textStyle: const TextStyle(fontSize: 16), // Set the text style of the button text
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Set the border radius of the button
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Set the padding of the button
                elevation: 4, // Set the elevation of the button
              ),
              child: const Text('Random Number'),
            )

          ],
        ),
      ),
    );
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    numberStream.addNumberToSink(myNum);
  }
}
