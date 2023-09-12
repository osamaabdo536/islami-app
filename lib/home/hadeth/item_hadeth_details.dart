import 'package:flutter/material.dart';
import 'package:flutter_islami_app/home/hadeth/hadeth_details_screen.dart';

class ItemHadethDetails extends StatelessWidget {
  String content;
  ItemHadethDetails({required this.content });
  @override
  Widget build(BuildContext context) {
    return Text(content ,
      style: Theme.of(context).textTheme.titleSmall,
      textAlign: TextAlign.center,
    );
  }
}

