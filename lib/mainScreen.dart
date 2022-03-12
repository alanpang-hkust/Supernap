import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'Sleeping.dart';
import 'main.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class mainScreen extends StatefulWidget{
  State<StatefulWidget> createState(){
    return mainScreenState();
  }
}

 class mainScreenState extends State<mainScreen>{

  AssetsAudioPlayer player = AssetsAudioPlayer();

  String timeused1 = "8 mins";
  String timeused2 = "16 mins";
  String timeused3 = "24 mins";
  bool mode1 = true;
  var duration;
  int totoalminutes = 0;
  bool custom = false;
  static int hours = 0;
  static int minutes = 0;
  static int seconds = 0;

  TimeOfDay _time = TimeOfDay.now().replacing(hour: 11, minute: 30);
  bool iosStyle = true;

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  static bool sunrisedAlarm = false;
  static var sound;

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: Scaffold(
    appBar: AppBar(title: Text('  SuperNap',style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,elevation: 0,),
    body:

    Column( children:[

      //device information
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child:
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.88,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x3A000000),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.white,
                  width: 0,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/face.jpg',
                            width: 74,
                            height: 74,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment:
                                    AlignmentDirectional(-1, 0),
                                    child: Text(
                                      'SNMask v1.024',
                                        style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        )
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                    AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 4),
                                      child: Text(
                                        'Simon\'s Mask',
                                          style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          )
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                    AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 4),
                                      child: Text(
                                        'Battery: 69%',
                                          style: TextStyle(
                                            fontFamily: 'Quicksand',
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Align(
                                  alignment:
                                  AlignmentDirectional(0.55, 0),
                                  child: IconButton(
                                    //borderColor: Colors.transparent,
                                    //borderRadius: 30,
                                    //borderWidth: 1,
                                    //buttonSize: 60,
                                    icon: Icon(
                                      Icons.settings,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      Navigator.push(context,
                                         MaterialPageRoute(builder:(context)=>DevicePage()));
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      //Mode
      Padding(
        padding: EdgeInsets.fromLTRB(20,0,0,5),
        child:
            Column(children: [
              Row(children: [
                Text('Mode',style: TextStyle(fontSize: 20,color: Colors.black)), //time length module
              ]),
            ],)
      ),
      Padding(
            padding: EdgeInsets.fromLTRB(20,5,20,0),
            child:
            Row(children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0,0,5,0),
                child:
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        timeused1 = "8 mins";
                        timeused2 = "16 mins";
                        timeused3 = "24 mins";
                        mode1 = true;
                        print(sunrisedAlarm);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize: Size(183,80),

                    ),
                    child: Column(children: [
                      Text('Quick Nap',style: TextStyle(fontSize: 20,color: Colors.white)),
                      Row(children: [
                        Icon(Icons.access_alarm , color: Colors.white, size: 15,),
                        Text(' '),
                        Text('5 - 24 minutes',style: TextStyle(fontSize: 15,color: Colors.white))],)
                    ],
                    )
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      timeused1 = "6 hrs";
                      timeused2 = "8 hrs";
                      timeused3 = "10 hrs";
                      mode1 = false;
                    });

                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize: Size(183,80)
                  ),
                  child: Column(children: [
                    Text('Deep Sleep',style: TextStyle(fontSize: 20,color: Colors.white)),
                    Row(children: [
                      Icon(Icons.access_alarm , color: Colors.white, size: 15,),
                      Text(' '),
                      Text('4-5 hours',style: TextStyle(fontSize: 15,color: Colors.white))],)
                  ],)
              ),
            ],),
        ),
            //Sounds
      Padding(
        padding: EdgeInsets.fromLTRB(20,20,20,0),
        child:
        Row(children: [
          Text('Sound',style: TextStyle(fontSize: 20,color: Colors.black)), //time length module
        ]),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(20,8,0,20),
        child:
        Container(
          height: 80,
          child:
          ListView(
            scrollDirection: Axis.horizontal,
            children: [

              Padding(
                  padding: EdgeInsets.fromLTRB(0,5,5,0),
                  child:
                  ElevatedButton(
                      onPressed: (){
                        sound = 'rain';
                        print('rain');
                        player.stop();
                        player.open(Audio('assets/sound/rain.mp3'),showNotification: true);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          minimumSize: Size(120,60)
                      ),
                      child: Column(children: [
                        Icon(Icons.bathroom , color: Colors.white, size: 50,),
                        Text('Rain',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],)
                  ),
              ),

              Padding(
                  padding: EdgeInsets.fromLTRB(0,5,5,0),
                  child:
                  ElevatedButton(
                      onPressed: (){
                        sound = 'lecture';
                        print('lecture');
                        player.stop();
                        player.open(Audio('assets/sound/lecture.mp3'),showNotification: true);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          minimumSize: Size(120,60)
                      ),
                      child: Column(children: [
                        Icon(Icons.book , color: Colors.white, size: 50,),
                        Text('Lecture',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],)
                  ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0,5,5,0),
                  child:
                  ElevatedButton(
                      onPressed: (){
                        sound = 'meditation';
                        print('meditation');
                        player.stop();
                        player.open(Audio('assets/sound/meditation.mp3'),showNotification: true);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          minimumSize: Size(120,60)
                      ),
                      child: Column(children: [
                        Icon(Icons.cloud , color: Colors.white, size: 50,),
                        Text('Medit',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],)
                  ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0,5,5,0),
                  child:
                  ElevatedButton(
                      onPressed: (){
                        sound = 'lofi';
                        print('lofi');
                        player.stop();
                        player.open(Audio('assets/sound/lofi.mp3'),showNotification: true);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          minimumSize: Size(120,60)
                      ),
                      child: Column(children: [
                        Icon(Icons.local_cafe , color: Colors.white, size: 50,),
                        Text('Lofi',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],)
                  ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0,5,5,0),
                  child:
                  ElevatedButton(
                      onPressed: (){
                        sound = 'Custom';
                        player.stop();
                        print(custom);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          minimumSize: Size(120,60)
                      ),
                      child: Column(children: [
                        Icon(Icons.favorite_border , color: Colors.white, size: 50,),
                        Text('Custom',style: TextStyle(fontSize: 15,color: Colors.white)),
                      ],)
                  ),
              ),
            ],
          ),
        ),
      ),

    //time used
      Padding(
            padding: EdgeInsets.fromLTRB(20,0,0,0),
            child:
            Row(children: [
              Text('Duration',style: TextStyle(fontSize: 20,color: Colors.black)), //time length module
            ]),
        ),
      Padding(
            padding: EdgeInsets.fromLTRB(20,5,0,20),
            child:
            Row(children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0,5,5,0),
                  child:
                  ElevatedButton(
                    onPressed: (){
                      if(mode1) {
                        hours = 0; minutes = 8; seconds = 0;
                        custom = false;
                      }
                      else {
                        hours = 6; minutes = 0; seconds = 0;
                        custom = false;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        minimumSize: Size(90,50)
                    ),
                    child:
                    Text(timeused1,style: TextStyle(fontSize: 15,color: Colors.white)),
                  ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0,5,5,0),
                  child:
                  ElevatedButton(
                    onPressed: (){
                      if(mode1) {
                        hours = 0; minutes = 16; seconds = 0;
                        custom = false;
                      }
                      else {
                        hours = 8; minutes = 0; seconds = 0;
                        custom = false;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        minimumSize: Size(90,50)
                    ),
                    child:
                    Text(timeused2,style: TextStyle(fontSize: 15,color: Colors.white)),
                  ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0,5,5,0),
                  child:
                  ElevatedButton(
                    onPressed: (){
                      if(mode1) {
                        hours = 0; minutes = 24; seconds = 0;
                        custom = false;
                      }
                      else {
                        hours = 10; minutes = 0; seconds = 0;
                        custom = false;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        minimumSize: Size(90,50)
                    ),
                    child:
                    Text(timeused3,style: TextStyle(fontSize: 15,color: Colors.white)),
                  ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0,5,5,0),
                  child:
                  ElevatedButton(
                    onPressed: (){
                      custom = true;
                      Navigator.of(context).push(
                        showPicker(
                          context: context,
                          value: _time,
                          onChange: onTimeChanged,
                        ),
                      );
                      },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        minimumSize: Size(90,50)
                    ),
                    child:
                    Text('Custom',style: TextStyle(fontSize: 15,color: Colors.white)),
                  ),
              ),
      ],),
    ),

    //sunrise module
        Padding(
            padding: EdgeInsets.fromLTRB(20,5,0,65),
            child:
            Row(children: [
              Text('Sunrise Alarm',style: TextStyle(fontSize: 20,color: Colors.black)),
              Padding(
                padding: EdgeInsets.fromLTRB(173,0,0,0),
                child:
                CrazySwitch(),
              ),
            ],),
        ),

      //final sleep button
      Padding(
        padding: EdgeInsets.fromLTRB(0,0,0,0),
        child:
        Column(children: [
          Divider(
            height: 25,
            thickness: 1,
          ),
          ElevatedButton.icon(
            onPressed: (){
              startSleeping();
            },
            icon: Icon(
              Icons.nights_stay_outlined , color: Colors.white, size: 20.0,),
            label: Text('Start Now',style: TextStyle(fontSize: 18,color: Colors.white)),
            style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                minimumSize: Size(MediaQuery.of(context).size.width * 0.88,50)
            ),
          ),

        ],)
      ),
    ])));

  }

  void startSleeping(){
    if(hours==0 && minutes ==0 && seconds==0){
      showDialog(
          context: context,
          builder: (_) =>
              AlertDialog(
                title: Text('Hey!'),
                content: Text('You forget to set the duration first!'),
                elevation: 5,
              ),
        barrierDismissible: true,
      );
    }else{

    if(custom){
      totoalminutes = (_time.hour*60 + _time.minute)-(DateTime.now().hour*60+DateTime.now().minute);
      totoalminutes = totoalminutes>0? totoalminutes:totoalminutes+24*60;
      hours = totoalminutes ~/ 60;
      minutes = totoalminutes % 60;
      print(hours);
      print(minutes);
    }

    Navigator.push(context,
        MaterialPageRoute(builder:(context)=>Sleeping()));
    }
  }
}

class CrazySwitch extends StatefulWidget {
  @override
  CrazySwitchState createState() => CrazySwitchState();
}
class CrazySwitchState extends State<CrazySwitch> with SingleTickerProviderStateMixin{

  bool isChecked = false;
  Duration _duration = Duration(milliseconds: 370);
  var _animation;
  var _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        duration: _duration
    );

    _animation = AlignmentTween(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight
    ).animate(
      CurvedAnimation(
          parent: _animationController,
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceIn
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child){
        return Container(
          width: 70,
          height: 30,
          padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
          decoration: BoxDecoration(
              color: isChecked ? Colors.greenAccent : Colors.blueGrey,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
          ),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: _animation.value,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      if(_animationController.isCompleted){
                        _animationController.reverse();
                      }else{
                        _animationController.forward();
                      }

                      isChecked = !isChecked;
                      mainScreenState.sunrisedAlarm= isChecked;
                    });
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,

                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}


