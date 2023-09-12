import 'package:flutter/material.dart';
import 'package:flutter_islami_app/home/hadeth/hadeth_details_screen.dart';

class ItemHadethName extends StatelessWidget {
  String name;
  int index ;
  ItemHadethName({required this.name ,required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(HadethDetailsScreen.routeName ,
          arguments: HadethDetailsArgs(
              name: name,
              index: index
          ),
        );
      },
      child: Text(name ,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
class HadethDetailsArgs{
  String name ;
  int index ;
  HadethDetailsArgs({required this.name,required this.index});
}
