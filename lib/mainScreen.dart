import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'Sleeping.dart';
import 'main.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'settingPage.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'newMainScreen.dart';

class mainScreen extends StatefulWidget{
  State<StatefulWidget> createState(){
    return mainScreenState();
  }
}

 class mainScreenState extends State<mainScreen> {

  AssetsAudioPlayer player = AssetsAudioPlayer();
  String timeused1 = "5 secs";
  String timeused2 = "16 mins";
  String timeused3 = "24 mins";
  bool mode1 = true;
  var duration;
  int totoalminutes = 0;
  bool custom = false;
  static int hours = 0;
  static int minutes = 0;
  static int seconds = 0;
  String customString = 'Custom';
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

    setState(() {
      if(custom){
        totoalminutes = (_time.hour*60 + _time.minute)-(DateTime.now().hour*60+DateTime.now().minute);
        totoalminutes = totoalminutes>0? totoalminutes:totoalminutes+24*60;
        hours = totoalminutes ~/ 60;
        minutes = totoalminutes % 60;
        customString = '${hours}h ${minutes}m';
      }
    });

    return MaterialApp(home:
    Scaffold(
      appBar: AppBar(title: Text('  SuperNap',                          style: GoogleFonts.quicksand(
        fontWeight: FontWeight.w600,textStyle: TextStyle(color: Colors.black, letterSpacing: .5),),),backgroundColor: Colors.white,elevation: 0,),
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
                          EdgeInsetsDirectional.fromSTEB(9, 2, 0, 0),
                          child:
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                        AlignmentDirectional(0, 0),
                                        child: Text(
                                          'SNMask v1.024',
                                          style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 13, color: Colors.black, letterSpacing: .5),),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                        AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 4, 0, 4),
                                          child: Text(
                                            'Simon\'s Mask',
                                            style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 13, color: Colors.black, letterSpacing: .5),),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                        AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 4, 0, 4),
                                          child: Text(
                                            'Battery: 69%',
                                            style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 13, color: Colors.black, letterSpacing: .5),),
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
                                              MaterialPageRoute(builder:(context)=>newMainScreen()));
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
                    Text('Mode',
                      style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: .5),),
                    ), //time length module
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
                            timeused1 = "5 secs";
                            timeused2 = "16 mins";
                            timeused3 = "24 mins";
                            mode1 = true;
                            print(sunrisedAlarm);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: Size(183,80),
                          elevation: 5
                        ),
                        child: Column(children: [
                          Text('Quick Nap',
                            style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: .5),),
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0,8,0,0),
                              child: Row(children: [
                            Icon(Icons.access_alarm , color: Colors.black, size: 15,),
                            Text(' 5 - 24 minutes',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 12, color: Colors.black, letterSpacing: .5),),
                            )])
                          )],
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
                          primary: Colors.white,
                          minimumSize: Size(183,80),
                        elevation: 5
                      ),
                      child: Column(children: [
                        Text('Deep Sleep',
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: .5),),
                  ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0,8,0,0),
                            child: Row(children: [
                              Icon(Icons.access_alarm , color: Colors.black, size: 15,),
                              Text(' 6 - 10 hours',
                                style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 12, color: Colors.black, letterSpacing: .5),),
                              )]))
                        ],)
                  ),
                ],),
            ),
                //Sounds
          Padding(
            padding: EdgeInsets.fromLTRB(20,20,20,0),
            child:
            Row(children: [
              Text('Sound',
                style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: .5),),
              ), //time length module
            ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20,8,0,20),
            child:
            Container(
              height: 90,
              child:
              ListView(
                scrollDirection: Axis.horizontal,
                children: [

                  Padding(
                      padding: EdgeInsets.fromLTRB(0,5,5,5),
                      child:
                      ElevatedButton(
                          onPressed: (){
                            sound = 'rain';
                            print('rain');
                            player.stop();
                            player.open(Audio('assets/sound/rain.mp3'),showNotification: true);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              minimumSize: Size(120,60),
                            elevation: 5
                          ),
                          child:
                          Padding(
                              padding: EdgeInsets.fromLTRB(0,10,50,0),
                            child:
                            Column(
                              children: [
                                Icon(Icons.bathroom , color: Colors.black, size: 40,),
                                Text('Rain',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 15, color: Colors.black, letterSpacing: .5),),
                                ),
                              ],)
                          ),
                      ),
                  ),

                  Padding(
                      padding: EdgeInsets.fromLTRB(0,5,5,5),
                      child:
                      ElevatedButton(
                          onPressed: (){
                            sound = 'lecture';
                            print('lecture');
                            player.stop();
                            player.open(Audio('assets/sound/lecture.mp3'),showNotification: true);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              elevation: 5,
                              minimumSize: Size(120,60)
                          ),
                          child:
                          Padding(
                              padding: EdgeInsets.fromLTRB(0,10,40,0),
                              child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Icon(Icons.book_outlined , color: Colors.black, size: 40,),
                                  Text('Lecture',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 15, color: Colors.black, letterSpacing: .5),),
                                  ),
                                ],)
                          ),
                      ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0,5,5,5),
                      child:
                      ElevatedButton(
                          onPressed: (){
                            sound = 'meditation';
                            print('meditation');
                            player.stop();
                            player.open(Audio('assets/sound/meditation.mp3'),showNotification: true);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              elevation: 5,
                              minimumSize: Size(120,60)
                          ),
                          child:
                          Padding(
                              padding: EdgeInsets.fromLTRB(0,10,15,0),
                              child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Icon(Icons.cloud_queue , color: Colors.black, size: 40,),
                                  Text('Meditaiton',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 15, color: Colors.black, letterSpacing: .5),),
                                  ),
                                ],)
                          ),
                      ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0,5,5,5),
                      child:
                      ElevatedButton(
                          onPressed: (){
                            sound = 'lofi';
                            print('lofi');
                            player.stop();
                            player.open(Audio('assets/sound/lofi.mp3'),showNotification: true);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              elevation: 5,
                              minimumSize: Size(120,60)
                          ),
                          child:
                          Padding(
                              padding: EdgeInsets.fromLTRB(0,10,55,0),
                              child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Icon(Icons.coffee , color: Colors.black, size: 40,),
                                  Text('Lofi',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 15, color: Colors.black, letterSpacing: .5),),
                                  ),
                                ],)
                          ),
                      ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0,5,5,5),
                      child:
                      ElevatedButton(
                          onPressed: (){
                            sound = 'Custom';
                            player.stop();
                            custom_music();
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              elevation: 5,
                              minimumSize: Size(120,60)
                          ),
                          child:
                          Padding(
                              padding: EdgeInsets.fromLTRB(0,10,40,0),
                              child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.heart_broken , color: Colors.black, size: 40,),
                                  Text('Custom',
                                    style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 15, color: Colors.black, letterSpacing: .5),),
                                  ),
                                ],)
                          ),
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
                  Text('Duration',
                    style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: .5),),
                  ), //time length module
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
                            hours = 0; minutes = 0; seconds = 5;
                            custom = false;
                          }
                          else {
                            hours = 6; minutes = 0; seconds = 0;
                            custom = false;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 5,
                            minimumSize: Size(90,50)
                        ),
                        child:
                        Text(timeused1,
                          style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 15, color: Colors.black, letterSpacing: .5),),
          ),
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
                            primary: Colors.white,
                            elevation: 5,
                            minimumSize: Size(90,50)
                        ),
                        child:
                        Text(timeused2,
                          style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 15, color: Colors.black, letterSpacing: .5),),
                        ),
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
                            primary: Colors.white,
                            elevation: 5,
                            minimumSize: Size(90,50)
                        ),
                        child:
                        Text(timeused3,
                          style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 15, color: Colors.black, letterSpacing: .5),),
                        ),
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
                            primary: Colors.white,
                            elevation: 5,
                            minimumSize: Size(90,50)
                        ),
                        child:
                        Text('$customString',
                          style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 15, color: Colors.black, letterSpacing: .5),),
                        ),
                      ),
                  ),

          ],),
        ),

        //sunrise module

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
                  Icons.nights_stay_outlined , color: Colors.black, size: 20.0,),
                label: Text('Start Now',
                  style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: .5),),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.88,50)
                ),
              ),

            ],)
          ),
    ])));

  }

  void custom_music() async{
    print("hered");
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path.toString());
      print("asadsadasdasd");
      print(file.toString());
      player.open(
      Audio.file(result.files.single.path.toString())
      );
    } else {
      // User canceled the picker
    }

    //String tempPath = tempDir.path;
    //print(tempPath);

    //player.open(
      //Audio.file(tempPath),
    //);
    //return tempPath;
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



