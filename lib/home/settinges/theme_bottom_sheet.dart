import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_islami_app/my_theme.dart';
import 'package:flutter_islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: provider.isDarkMode() ?
      MyTheme.primaryDark
          :
      MyTheme.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.isDarkMode() ?
            getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                :getUnSelectedItemWidget(AppLocalizations.of(context)!.dark)
            ,
          ),
          InkWell(
            onTap: (){
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.isDarkMode()?
            getUnSelectedItemWidget(AppLocalizations.of(context)!.light)
                :getSelectedItemWidget(AppLocalizations.of(context)!.light)
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text){
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: provider.isDarkMode() ?
              MyTheme.whiteColor
                  :
              Theme.of(context).primaryColor,
            ),
          ),
          Icon(Icons.check ,
            color: provider.isDarkMode() ?
            MyTheme.whiteColor
                :
            Theme.of(context).primaryColor,
            size: 30,
          )
        ],
      ),
    );
  }
  Widget getUnSelectedItemWidget(String text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text ,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
