import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/radio_logo.png'),
          Text('إذاعة القرآن الكريم' ,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.fast_rewind ,
                size: 40,
              ),
              Icon(Icons.play_arrow ,
                size: 50,
              ),
              Icon(Icons.fast_forward ,
                size: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
