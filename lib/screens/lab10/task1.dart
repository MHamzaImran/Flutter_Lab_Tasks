import 'dart:convert';
import 'package:flutter/material.dart';

class SearchListScreen extends StatefulWidget {
  const SearchListScreen({Key? key}) : super(key: key);

  @override
  SearchListScreenState createState() => SearchListScreenState();
}

class SearchListScreenState extends State<SearchListScreen> {
  late String searchString;

  Future<void> readJsonFile() async {
    final jsonContent = await DefaultAssetBundle.of(context)
        .loadString('assets/search_list.json');
    setState(() {
      searchString = jsonContent;
    });
  }

  @override
  void initState() {
    super.initState();
    readJsonFile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MAD Lab 10', style: TextStyle(color: Colors.black),),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 1,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder<List<Search>>(
            future: _getSearchResults(),
            builder: (context, snapshot) {
              // print(snapshot.error);
              if (snapshot.hasData) {
                final searchResults = snapshot.data!;
                return ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final searchResult = searchResults[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Card( 
                        color: Colors.blue[50],
                        elevation: 5,
                        child: Column(
                          children: [
                            ListTile(
                                title: Text(
                                  searchResult.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                subtitle: Text(searchResult.url),
                                trailing: Text(searchResult.date,
                                    style: const TextStyle(fontSize: 12))),
                            Card(
                              elevation: 0,
                              color: Colors.blue[50],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  spacing: 12,
                                  children: searchResult.tags
                                      .map((tag) => Chip(
                                            label: Text(tag),
                                            backgroundColor: Colors.lightBlueAccent,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 5),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(20),
                                                    bottomRight:
                                                        Radius.circular(20))),
                                          ))
                                      .toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  Future<List<Search>> _getSearchResults() async {
    try {
      Map<String, dynamic> jsonMap = json.decode(searchString);
      List<dynamic> searchList = jsonMap['results'];

      List<Search> results =
          searchList.map((json) => Search.fromJson(json)).toList();
      return results;
    } catch (e) {
      // print('JSON parsing error: $e');
      return [];
    }
  }
}

class Search {
  final String url;
  final String contentType;
  final String title;
  final String date;
  final List<String> tags;

  Search({
    required this.url,
    required this.contentType,
    required this.title,
    required this.date,
    required this.tags,
  });

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      url: json['url'] != null ? json['url'].toString() : '',
      contentType:
          json['contentType'] != null ? json['contentType'].toString() : '',
      title: json['title'] != null ? json['title'].toString() : '',
      date: json['date'] != null ? json['date'].toString() : '',
      tags: json['tags'] != null
          ? List<String>.from(json['tags'] as List<dynamic>)
          : [],
    );
  }
}
