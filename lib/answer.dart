import 'package:flutter/material.dart';

class Answer extends StatelessWidget{

  final Function() selectHandler;
  String answerText = '';
  Answer(this.selectHandler,this.answerText);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child:RaisedButton(
        color: Colors.red,
        textColor: Colors.white,
        child: Text('Answer 1'),
        onPressed: selectHandler,
      ),
    );
  }
}