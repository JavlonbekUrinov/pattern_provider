import 'package:flutter/cupertino.dart';
import 'package:pattern_provider/models/post_model.dart';
import 'package:pattern_provider/services/http_service.dart';

class UpdateViewPage extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  bool isLoading = false;

  void updatePost() async {
    isLoading = true;
    notifyListeners();

    String title = titleController.text.trim().toString();
    String body = bodyController.text.trim().toString();
    Post post = Post(title: title, body: body);
    if (title.isNotEmpty && body.isNotEmpty) {
      await Network.PUT(Network.API_UPDATE, Network.paramsUpdate(post))
          .then((value) {
        getResponse();
      });
    }
  }

  void getResponse() {
    isLoading = false;
    notifyListeners();
  }
}
////////////////////////////////////////////Well done and updated