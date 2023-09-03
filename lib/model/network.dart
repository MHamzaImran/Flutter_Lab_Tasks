import 'package:dio/dio.dart';

// Task 2 part 1
class NetworkHandler {

  Future getData(var url) async {
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      print(response.statusCode);
    }
  }
}

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


// Task 3

class EmailAddress {
  final String address;

  EmailAddress(this.address);

  static Iterable<EmailAddress> parseEmailAddresses(Iterable<String> emailStrings) {
    return emailStrings.map((email) => EmailAddress(email));
  }

  static bool isValidEmailAddress(EmailAddress emailAddress) {
    // Define regular expression pattern for email address validation
    const pattern = r"^[a-zA-Z0-9.!#$%&\'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$";

    // Use regular expression to match against the email address
    final regex = RegExp(pattern);
    return regex.hasMatch(emailAddress.address);
  }

  static bool anyInvalidEmailAddress(Iterable<EmailAddress> emailAddresses) {
    return emailAddresses.any((email) => !isValidEmailAddress(email));
  }

  static Iterable<EmailAddress> validEmailAddresses(Iterable<EmailAddress> emailAddresses) {
    return emailAddresses.where((email) => isValidEmailAddress(email));
  }
}