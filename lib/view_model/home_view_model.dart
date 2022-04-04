import 'package:flutter/cupertino.dart';
import 'package:pattern_provider/models/post_model.dart';
import 'package:pattern_provider/services/http_service.dart';

class HomeViewModel extends ChangeNotifier {

  bool isLoading = false;
  List<Post> items = [];

  //////// olib kelmoq
  void apiPostList() async {
    isLoading = true;
    notifyListeners();

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());

    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
    notifyListeners();
  }


  ///// delete post
  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;
    notifyListeners();

    var response = await Network.GET(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

    isLoading = false;
    notifyListeners();

    apiPostList();
    return response != null;
  }
}



