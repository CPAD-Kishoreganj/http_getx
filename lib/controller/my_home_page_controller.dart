import 'package:get/get.dart';
import 'package:http_getx/models/post_model.dart';
import 'package:http_getx/services/api_service.dart';

class MyHomePageController extends GetxController {
  final service = Get.put(ApiService());
  final posts = <PostModel>[].obs;

  Future getPosts() async {
    final result = await service.fetchPosts();
    posts.addAll(result);
  }

  @override
  void onInit() async {
    await getPosts();
    super.onInit();
  }
}
