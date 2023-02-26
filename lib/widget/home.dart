import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../controllers/TodosController.dart';

class Home extends StatelessWidget {
  final dataController = Get.put(TodosController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<TodosController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.todos_data.length,
                    itemBuilder: (BuildContext content, int index) {
                      return Container(
                        child: Column(
                          children: [
                            Text("${controller.todos_data[index].userId}"),
                            Text("${controller.todos_data[index].id}"),
                            Text("${controller.todos_data[index].title}"),
                            Text("${controller.todos_data[index].completed}"),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            // Container(
            //   child: const TextField(
            //     obscureText: true,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Enter',
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
