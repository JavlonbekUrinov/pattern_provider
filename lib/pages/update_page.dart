import 'package:flutter/material.dart';
import 'package:pattern_provider/view_model/update_view_page.dart';

import '../models/post_model.dart';

class UpdatePage extends StatefulWidget {
   UpdatePage({this.post, Key? key}) : super(key: key);
Post? post;
static const String id = "update_page";

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  UpdateViewPage viewModel = UpdateViewPage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.titleController = TextEditingController(text: widget.post!.title!);
    viewModel.bodyController = TextEditingController(text: widget.post!.body!);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: widget.post != null ? Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: viewModel.titleController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                ),

                const SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: viewModel.bodyController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                ),

                const SizedBox(height: 30,),

                MaterialButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  minWidth: MediaQuery.of(context).size.width - 100,
                  height: 45,
                  onPressed: (){
                    viewModel.updatePost();
                    Navigator.pop(context);
                  },
                  child: const Text('Update Post', style: TextStyle(color: Colors.white, fontSize: 17),),
                ),
////////////////////////////////////////////Well done and updated
              ],
            ),
            viewModel.isLoading ? const Center(child: CircularProgressIndicator(),) : const SizedBox.shrink(),
          ],
        ) : const Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}
