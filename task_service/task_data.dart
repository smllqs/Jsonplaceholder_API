import 'dart:convert';
import 'package:http/http.dart' as http;

class TaskData {
  // late final _data;
  
  Future<List> fetchdata() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1/todos'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load post.');
    }
  }
}
