import 'dart:math';

import 'package:flutter/material.dart';

class MadLab4 extends StatefulWidget {
  const MadLab4({Key? key}) : super(key: key);

  @override
  State<MadLab4> createState() => _MadLab4State();
}

class _MadLab4State extends State<MadLab4> {
  var button1 = 'Generate Random Number';
  var button2 = 'TASK IN UPPER CASE';
  int task4Number = 0;
  // increment function for numbers
  void increment() {
    setState(() {
      task4Number++;
    });
  }

  // decrement function for only positive numbers
  void decrement() {
    setState(() {
      if (task4Number >= 0) {
        task4Number--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(20),
                elevation: 10,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const Text(
                        'Task 1',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 0.3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // icon for random number
                          const Icon(
                            Icons.casino,
                            color: Colors.green,
                            size: 30,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  button1 =
                                      'Random Number : ${Random().nextInt(100)}';
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              child: Text(button1)),
                        ],
                      ),
                      // convert text to lower case
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // icon for lower case
                          const Icon(
                            Icons.text_fields,
                            color: Colors.red,
                            size: 30,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  // toggle
                                  button2 = button2 == button2.toLowerCase()
                                      ? button2.toUpperCase()
                                      : button2 = button2.toLowerCase();
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: Text(button2)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            SizedBox(
              width: double.infinity,
              child: Card(
                margin: const EdgeInsets.all(20),
                elevation: 10,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const Text(
                        'Task 4',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 0.3,
                      ),
                      // increment and decrement buttons
                      ListTile(
                        
                        title: Center(child: Text('$task4Number')),
                        leading: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: IconButton(
                            onPressed: () {
                              increment();
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        trailing: CircleAvatar(
                          backgroundColor: (task4Number < 1)? Colors.black12 :Colors.red,
                          child: IconButton(
                            onPressed: task4Number >= 1 ? decrement : null,
                            icon: Icon(
                              Icons.remove,
                              color: (task4Number < 1)? Colors.black :Colors.white,
                            ),
                          ),
                        )
                        
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
