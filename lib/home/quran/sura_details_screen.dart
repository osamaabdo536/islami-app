import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_islami_app/home/quran/item_sura_details.dart';
import 'package:flutter_islami_app/my_theme.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgus ;
    if(verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(children: [
      Image.asset(
        'assets/images/main_background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            '${args.name}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: verses.length == 0 ?
            Center(child: CircularProgressIndicator())
            :
        Container(
          decoration: BoxDecoration(
            color: MyTheme.whiteColor,
            borderRadius: BorderRadius.circular(25),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width*0.05,
            vertical: MediaQuery.of(context).size.height*0.08,
          ),
          child: ListView.separated(
            separatorBuilder: (context,index){
            return Divider(
              color: Theme.of(context).primaryColor,
              thickness: 2,
            );
          },
              itemBuilder: (context,index){
                return ItemSuraDetails(content: verses[index] ,index: index);
              },
            itemCount: verses.length,
          ),
        ),
      ),
    ]);
  }

  void loadFile(int index)async{
    String content = await rootBundle.loadString('assets/files/${index+1}.txt');
    List<String> lines = content.split('\n');
    verses = lines ;
    setState(() {

    });
  }
}

class SuraDetailsArgus{
  String name ;
  int index ;
  SuraDetailsArgus({required this.name ,required this.index});

}
