import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import '../models/Todos.dart';

class TodosController extends GetxController {
  var todos_data = <Todos>[].obs;

  @override
  void onInit() {
    fetchApi();
    super.onInit();
  }

  void fetchApi() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var Request = json.decode(response.body);
      todos_data.assignAll(Request.map<Todos>((json) => Todos.fromJson(json)));
    }
  }
}
