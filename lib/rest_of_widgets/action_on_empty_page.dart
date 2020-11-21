import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String _text;
  EmptyPage(this._text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30,),
        Container(
          padding: EdgeInsets.all(20),
          child: Text(_text , style: Theme.of(context).textTheme.headline6, ),
        ),

        Container(
          height: 350,

            child: Image.asset('assets/zzz - Copy.png', fit: BoxFit.cover,),
        ),
      ],
    );
  }

}