import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_islami_app/my_theme.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/radio_logo.png'),
          Text(AppLocalizations.of(context)!.quran_radio ,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.fast_rewind ,
                color: provider.isDarkMode() ?
                MyTheme.yellowColor
                    :
                Colors.brown,
                size: 40,
              ),
              Icon(Icons.play_arrow ,
                color: provider.isDarkMode() ?
                MyTheme.yellowColor
                    :
                Colors.brown,
                size: 50,
              ),
              Icon(Icons.fast_forward ,
                color: provider.isDarkMode() ?
                MyTheme.yellowColor
                    :
                Colors.brown,
                size: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
