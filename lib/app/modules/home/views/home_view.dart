import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../model/user_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _TodosPageState();
}

class _TodosPageState extends State<HomeView> {
  // late Future<ApiModel> _futureTodos;
  // @override
  // void initState() {
  //   super.initState();
  //   _futureTodos = fetchTodos();
  // }
  // Future<ApiModel> fetchTodos() async {
  //   final response = await http
  //       .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/5'));
  //   if (response.statusCode == 200) {
  //     return ApiModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<UserModel>(
          future: controller.fetchTodos(),
          builder: (context, snapshot) {
            var state = snapshot.connectionState;
            if (state != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else {
                return const Text('');
              }
            }
          },
        ),
      ),
    );
  }
}