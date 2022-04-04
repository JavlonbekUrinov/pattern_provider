import 'package:flutter/material.dart';
import 'package:pattern_provider/view_model/add_view_model.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);
static const String id = "add_page";
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  AddViewPage viewModel = AddViewPage();




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor:  Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
        title: const Text('Add Post'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller:
                    viewModel.titleController,
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
                      hintText: 'Body',
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
                    viewModel.createPost();
                    Navigator.pop(context);
                  },
                  child: const Text('Save', style: TextStyle(color: Colors.white, fontSize: 17),),
                ),

              ],
            ),
          ),
          viewModel.isLoading ? SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Center(child: CircularProgressIndicator(),),
          ) : const SizedBox.shrink(),
        ],
      ),

    );
  }
}
