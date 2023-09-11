import 'package:flutter/material.dart';
import 'package:flutter_islami_app/home/hadeth/hadeth_tab.dart';
import 'package:flutter_islami_app/home/quran/quran_tab.dart';
import 'package:flutter_islami_app/home/radio/radio.dart';
import 'package:flutter_islami_app/home/tasbeh/tasbeh_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName ='HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/main_background.png' ,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Islami' ,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index){
                selectedIndex = index ;
                setState(() {

                });
              },
              items: [
                BottomNavigationBarItem(
                  icon:  ImageIcon(AssetImage('assets/images/icon_quran.png')),
                  label: 'Quran',
                ),
                BottomNavigationBarItem(
                  icon:  ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                  label: 'Hadeth',
                ),
                BottomNavigationBarItem(
                  icon:  ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                  label: 'Tasbeh',
                ),
                BottomNavigationBarItem(
                  icon:  ImageIcon(AssetImage('assets/images/icon_radio.png')),
                  label: 'Radio',
                ),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
  List<Widget> tabs = [
    QuranTab(),HadethTab(),TasbehTab(),RadioTab(),
  ];
}
