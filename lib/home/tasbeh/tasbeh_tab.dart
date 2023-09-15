import 'package:flutter/material.dart';
import 'package:flutter_islami_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  double turns = 0.0;
  int counter = 0;
  List<String> names = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
    'استغفر الله',

  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedRotation(
            turns: turns,
            duration: Duration(seconds: 1),
            child: InkWell(
              onTap: (){
                setState(() {
                  turns += 1/4 ;
                  counter++;
                  if(counter % 33 == 0){
                    index++;
                    if(index == 4){
                      index = 0;
                    }
                    names[index] ;
                  }
                });
              },
                child: Image.asset('assets/images/sebha_logo.png',
                  color: provider.isDarkMode() ?
                  MyTheme.yellowColor
                      :
                  Colors.brown
                ),
            ),
          ),
          Text(AppLocalizations.of(context)!.number_of_tasbeh ,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            width: 60,
            height: 70,
            decoration: BoxDecoration(
              color: provider.isDarkMode() ?
              MyTheme.primaryDark
                  :
              MyTheme.primaryLight,
              borderRadius: BorderRadius.circular(20),
          ),
            child: Center(
              child: Text('$counter' ,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: provider.isDarkMode() ?
              MyTheme.yellowColor
                  :
              MyTheme.primaryLight,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Text('  ${names[index]}  ' ,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
