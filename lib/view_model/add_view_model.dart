import 'package:flutter/cupertino.dart';
import 'package:pattern_provider/services/http_service.dart';

import '../models/post_model.dart';

class AddViewPage extends ChangeNotifier{


  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();



  bool isLoading = false;
  List<Post> items = [];

  void createPost() async{
      isLoading = true;
    notifyListeners();

    String title = titleController.text.trim().toString();
    String body = bodyController.text.trim().toString();

    Post post = Post(title: title, body: body);
    if(title.isNotEmpty && body.isNotEmpty) {
      await Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((value) {
        print(value);
        getResponse();
      });
    } else {

        isLoading = false;
        notifyListeners();

    }
    return ;
  }

  void getResponse() {
      isLoading = false;
      notifyListeners();
  }




}