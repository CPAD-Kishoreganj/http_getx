import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http_getx/controller/my_home_page_controller.dart';
import 'package:http_getx/models/post_model.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final controller = Get.put(MyHomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            final PostModel model = controller.posts[index];
            return Card(
              child: ListTile(
                title: Text(model.title),
                subtitle: Text(model.body),
              ),
            );
          },
        ),
      ),
    );
  }
}
