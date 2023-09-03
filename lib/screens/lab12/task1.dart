import 'dart:async';
import 'package:flutter/material.dart';

import 'color.dart';

class Lab12 extends StatefulWidget {
  const Lab12({Key? key}) : super(key: key);

  @override
  Lab12State createState() => Lab12State();
}

class Lab12State extends State<Lab12> {
  late Color bgColor = Colors.amber;
  late ColorClass colorStream;
  late StreamSubscription<Color> streamSubscription;

  @override
  void initState() {
    colorStream = ColorClass();
    changeColor();
    super.initState();
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Stream'),
        backgroundColor: Colors.black38,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        color: bgColor,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  streamSubscription.cancel();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Customized button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Stop',
                  style: TextStyle(
                    color: Colors.white, // Customized button text color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeColor() async {
    streamSubscription = colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }
}
