import 'package:flutter/material.dart';
import '../model/network.dart';

class MadLab3 extends StatelessWidget {
  const MadLab3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 3'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return FutureBuilder(
          future: NetworkHandler()
              .getData('https://codewithandrea.com/search/search.json'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(snapshot.data['results'][index]['title']),
                        leading:
                            Text(snapshot.data['results'][index]['contentType']),
                        // leading: Image.network(snapshot.data['results'][index]['url']),
                        subtitle: Text(snapshot.data['results'][index]['url']),
                        trailing: Text(snapshot.data['results'][index]['date']),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              if (snapshot.data['results'][index]['tags'].length > 0) Card(
                                color: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data['results'][index]['tags'][0],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              if (snapshot.data['results'][index]['tags'].length > 1) Card(
                                color: Colors.red,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data['results'][index]['tags'][1],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          Row(
                            children: [
                              if (snapshot.data['results'][index]['tags'].length > 2)
                                Card(
                                  color: Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data['results'][index]['tags'][2],
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              if (snapshot.data['results'][index]['tags'].length > 3)
                                Card(
                                  color: Colors.brown,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data['results'][index]['tags'][3],
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Row(
                            children: [
                              if (snapshot.data['results'][index]['tags'].length > 4)
                                Card(
                                  color: Colors.purple,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data['results'][index]['tags'][4],
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              if (snapshot.data['results'][index]['tags'].length > 5)
                                Card(
                                  color: Colors.pink,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data['results'][index]['tags'][5],
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                            ],
                          )
                          
                        ],
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      }),
    );
  }
}
