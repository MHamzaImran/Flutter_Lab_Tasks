import 'package:flutter/material.dart';

class Lab3Task3 extends StatelessWidget {
  const Lab3Task3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.purple,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Colors.yellow,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('T',
                                style: TextStyle(
                                    fontSize: 80,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            // divider
                            const Text('|',
                                style: TextStyle(
                                    fontSize: 200,
                                    fontWeight: FontWeight.w300,
                                    height: 1,
                                    color: Colors.black54)),
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: 80,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 8.0),
                    child: Divider(
                      color: Colors.black54,
                      thickness: 5,
                      height: 20,
                    ),
                  ),
                  const Text(
                    'T',
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
