import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/task.dart';
import '../models/user.dart';

class Urls {
  static String login = "login";
  static String newUser = "createnewuser";
  static String getTasks = "gettasks";

  final String urlName;
  const Urls(this.urlName);
}

final url = "https://shrouded-temple-33646-5a77aaedcc09.herokuapp.com/";

class ToDoListService {
  Future<bool> registerUser(User user) async {
    print("Register Started");
    Map<String, dynamic> jsonUser = user.toJson();
    print("URL: " + url + Urls.newUser);
    await http.post(Uri.parse(url + Urls.newUser),
        body: jsonEncode(jsonUser),
        headers: {
          'Content-Type': 'application/json',
        });
    //TODO: Return
    return true;
  }

  Future<int> loginUser(User user) async {
    print("Login Started");
    Map<String, dynamic> jsonUser = user.toJson();
    return await http.post(Uri.parse(url + Urls.newUser),
        body: jsonEncode(jsonUser),
        headers: {
          'Content-Type': 'application/json',
        }).then((response) {
      return response.statusCode;
    });
  }

  Future<List<Task>?> getTasks() async {
    final response = await http.get(Uri.parse(
        "https://shrouded-temple-33646-5a77aaedcc09.herokuapp.com/users"));
    if (response.statusCode == 200) {
      List<Map<String, dynamic>> decodedJson = jsonDecode(response.body);
      List<Task> listOfTasks = decodedJson
          .map((Map<String, dynamic> task) => Task.fromJson(task))
          .toList();
      return listOfTasks;
    } else if (response.statusCode == 404) {
      print("Not found!");
    } else {
      print("Other status occured ${response.statusCode}");
    }
  }
}
