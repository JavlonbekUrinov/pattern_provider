import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_provider/models/post_model.dart';
import 'package:pattern_provider/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel viewModel = HomeViewModel();


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pattern Provider"),
      ),

      body: ChangeNotifierProvider(
        create: (context) =>viewModel,
        child: Consumer<HomeViewModel>(
          builder: (ctx, model, index) => Stack(
            children: [
              ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: viewModel.items.length,
                itemBuilder: (ctx, index){
                  return itemOfPost(viewModel, viewModel.items[index]);
                },
              ),
              model.isLoading ? Center(
                child: CircularProgressIndicator(),
              ):SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: (){
          //////
        },
        child: Icon(Icons.add),
      ),

    );
  }

  Widget itemOfPost(HomeViewModel viewModel,Post post){
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context){
              viewModel.apiPostDelete(post);
            },
            flex: 3,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: "Delete",
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title!.toUpperCase(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),

            ),
            SizedBox(height: 5,),
            Text(post.body!),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
