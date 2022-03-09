import 'package:flutter/material.dart';
import 'mainScreen.dart';

import 'package:flutter/material.dart';

class Sleeping extends StatefulWidget {
  const Sleeping({Key? key}) : super(key: key);
  State<StatefulWidget> createState(){
    return SleepingState();
  }
}

class SleepingState extends State<Sleeping> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text('Sleeping Page')),
      backgroundColor: Colors.white, //background color of canvas
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
          ),
          child: InkWell(
            onTap: () async {},
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Divider(
                  height: 120,
                  color: Colors.transparent,
                ),
                Text(
                  'Enjoy Your Sleep',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.black,
                      fontSize: 30,
                    )
                ),
                Divider(
                  height: 10,
                  color: Colors.transparent,
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    'You can put on your mask & relax now',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )
                  ),
                ),
                Divider(
                  height: 150,
                  color: Colors.transparent,
                ),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFFF5F5F5),
                  child: Text(
                    'Time Remaining: xxx\n\n\n',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )
                  ),
                ),
                Divider(
                  height: 150,
                  color: Colors.transparent,
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: ElevatedButton.icon(
                    label: Text('Stop'),
                    onPressed: () {print('Button pressed ...');},
                    icon: Icon(Icons.pause, size: 12,),
                  ),
                ),
              ],
            ),
          ),

      ),
    );
  }
}

