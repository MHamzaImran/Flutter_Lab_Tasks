import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  TodoListScreenState createState() => TodoListScreenState();
}

class TodoListScreenState extends State<TodoListScreen> {
  late Future<List<Todo>> _future;
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
      await Dio().get('https://jsonplaceholder.typicode.com/todos/');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<Todo> todos = [];
        for (final item in data) {
          todos.add(Todo.fromJson(item));
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
        title: const Text('Todos'),
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : _errorMessage != null
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_errorMessage!),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadTodos,
              child: const Text('Retry'),
            ),
          ],
        ),
      )
          : FutureBuilder<List<Todo>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final todos = snapshot.data!;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text('ID: ${todo.id}'),
                  subtitle: Text('Title: ${todo.title}'),
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

class Todo {
  int id;
  String title;

  Todo({
    required this.id,
    required this.title,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
    );
  }
}
