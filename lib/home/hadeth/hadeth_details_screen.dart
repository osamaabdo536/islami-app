import 'package:flutter/material.dart';
import 'package:flutter_islami_app/home/hadeth/hadeth_tab.dart';
import 'package:flutter_islami_app/home/hadeth/item_hadeth_details.dart';
import 'package:flutter_islami_app/my_theme.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'Hadeth-Screen';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth ;
    return Stack(children: [
      Image.asset(
        'assets/images/main_background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text( args.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: MyTheme.whiteColor,
            borderRadius: BorderRadius.circular(25),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width*0.05,
            vertical: MediaQuery.of(context).size.height*0.04,
          ),
          child: ListView.builder(
            itemBuilder: (context,index){
              return ItemHadethDetails(content: args.content[index]);
            },
            itemCount: args.content.length,
          ),
        ),
      )
    ]);
  }


}
