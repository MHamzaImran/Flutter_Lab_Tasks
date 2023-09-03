
// model class to store the content of json file

 // Task 2 part 2
class Model {
  final String title;
  final String url;
  final String description;
  final String date;

  Model({required this.title, required this.url, required this.description, required this.date});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      title: json['title'],
      url: json['url'],
      description: json['description'],
      date: json['date'],
    );
  }
}

