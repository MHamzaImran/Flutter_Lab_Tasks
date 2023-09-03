import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  TaskListScreenState createState() => TaskListScreenState();
}

class TaskListScreenState extends State<TaskListScreen> {
  late Future<List<TaskModel>> _future;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    if (!await _isInternetAvailable()) {
      setState(() {
        _errorMessage = 'Internet connection not available.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/todos');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<TaskModel> todos = [];
        for (final item in data) {
          todos.add(TaskModel.fromJson(item));
        }
        setState(() {
          _future = Future.value(todos);
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to load todos';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load todos: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<bool> _isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
        elevation: 1,
        backgroundColor: Colors.blueGrey.shade900,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _errorMessage != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_errorMessage!,style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _loadTodos,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                )
              : FutureBuilder<List<TaskModel>>(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final todos = snapshot.data!;
                      return ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          final todo = todos[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Card(
                              child: ListTile(
                                title: Text('ID: ${todo.id}'),
                                subtitle: Text('Title: ${todo.title}'),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
    );
  }
}

class TaskModel {
  int id;
  String title;

  TaskModel({
    required this.id,
    required this.title,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
    );
  }
}
