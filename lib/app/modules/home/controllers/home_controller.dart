import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../model/user_model.dart';

class HomeController extends GetxController {
  late Future<UserModel> _futureTodos;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // _futureTodos = fetchTodos();
  }

  Future<UserModel> fetchTodos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/5'));
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}