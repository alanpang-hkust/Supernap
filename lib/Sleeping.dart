import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'mainScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'alarm.dart';
import 'newMainScreen.dart';

class Sleeping extends StatefulWidget {
  const Sleeping({Key? key}) : super(key: key);
  State<StatefulWidget> createState(){
    return SleepingState();
  }
}

class SleepingState extends State<Sleeping> {

  AssetsAudioPlayer player = AssetsAudioPlayer();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Duration duration = Duration();
  Timer? timer;
  bool isCountdown = true;
  static var coundownDuration;

  @override
  void initState(){
    super.initState();
    startTimer(); //start the countdown here
    reset();
  }

  void reset(){
    if(isCountdown){
      setState(() {
        coundownDuration = Duration(hours: newMainScreenState.hours, minutes: newMainScreenState.minutes,seconds: newMainScreenState.seconds);
        duration = coundownDuration;
      });
    }else
      setState(() {
        duration = Duration();
      });
  }

  void addTime(){
    final addSeconds = isCountdown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds+addSeconds;
      if(seconds<0) {
        showDialog(
            context: context,
            builder: (_) =>
                AlertDialog(
                  title: Text('Hey, wake up!',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 12, color: Colors.black, letterSpacing: .5),),
                  ),
                  content:
                  Text('Get back to work :)',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600,textStyle:
                    TextStyle(color: Colors.black, letterSpacing: .5),),
                  ),
                  actions: [TextButton(child:Text("Ok",
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 12, color: Colors.black, letterSpacing: .5),),
                  ), onPressed: (){ leaveSleepingPage();},)],
                  elevation: 5,
                )
        );
        if(newMainScreenState.sunrisedAlarm){
          //when countdown ends
          player.open(Audio(alarmState.path));
        }
        timer?.cancel();
      }else
      duration = Duration(seconds: seconds);
    });
  }

  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1),(_) => addTime());
  }

  void leaveSleepingPage(){
    newMainScreenState.sunrisedAlarm = false;
    timer?.cancel();
    player.stop();
    Navigator.pop(context,
        MaterialPageRoute(builder:(context)=>newMainScreen()));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      //backgroundColor: Colors.white, //background color of canvas
      body:
      InkWell(
        onTap: () async {},
        child:
        Stack(
          children:[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,

              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Page.png"),
                    fit: BoxFit.cover,
                  )
              ),


              child: InkWell(
                onTap: () async {},
                child:
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Divider(
                      height: 170,
                      color: Colors.transparent,
                    ),
                    Text(
                      'Enjoy Your Sleep',
                      style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 30, color: Colors.white, letterSpacing: .5),),
                    ),
                    Divider(
                      height: 10,
                      color: Colors.transparent,
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'You can put on your mask & relax now',
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 15, color: Colors.white, letterSpacing: .5),),
                      ),
                    ),
                    Divider(
                      height: 100,
                      color: Colors.transparent,
                    ),

                    Container(
                      color: Colors.transparent,
                      child:Column(
                        children: [

                          buildTime(),

                          Divider(
                            height: 14,
                            color: Colors.transparent,
                          ),
                          if (newMainScreenState.sunrisedAlarm )
                            Row(mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                              crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                              children: [
                                Icon(Icons.alarm_on, color: Colors.white,size: 15,),
                                Text('Alarm Oned',
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 12, color: Colors.white, letterSpacing: .5),),
                                ),
                              ],)
                        ],),
                    ),


                    Divider(
                      height: 135,
                      color: Colors.transparent,
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: ElevatedButton.icon(
                        label: Text('Stop',
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 18, color: Color.fromRGBO(120, 121, 241, 1), letterSpacing: .5),),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            minimumSize: Size(140,45),
                            elevation: 1
                        ),
                        onPressed: () { leaveSleepingPage();},
                        icon: Icon(Icons.pause, size: 18,color: Color.fromRGBO(120, 121, 241, 1)),

                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        )

        ,
      ),

    );


  }

  Widget buildTime(){
      String twoDigits(int n)=> n.toString().padLeft(2,'0');
      final hours = twoDigits(duration.inHours.remainder(60));
      final minutes = twoDigits(duration.inMinutes.remainder(60));
      final seconds = twoDigits(duration.inSeconds.remainder(60));



      return
        Row(
          children: [
            Column(
              children: [
                Text(
                  hours,
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 70, color: Colors.white, letterSpacing: .5),),
                ),
                Text(
                  minutes,
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 70, color: Colors.white, letterSpacing: .5),),
                ),
              ],
                mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.end //Center Row contents vertically,
            ),
            Column(
                children: [
                  Text(
                    '  hours',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 24, color: Colors.white, letterSpacing: .5),),
                  ),
                  Divider(
                    height: 60,
                  ),
                  Text(
                    '  mins',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 24, color: Colors.white, letterSpacing: .5),),
                  ),
                  Divider(
                    height: 10,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.start //Center Row contents vertically,
            ),
          ],
            mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
            crossAxisAlignment: CrossAxisAlignment.end //Center Row contents vertically,
        );
  }
}

/*
*
*
* Text(
              '$hours:$minutes:$seconds',
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 80, color: Colors.white, letterSpacing: .5),),
              )

*
*
*
*
*             Row(
                children: [
                  Text(
                    minutes,
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 70, color: Colors.white, letterSpacing: .5),),
                  ),
                  Text(' mins',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 30, color: Colors.white, letterSpacing: .5),),
                  ),],
                mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.end //Center Row contents vertically,
            ),

*
*
*
*
*
*
*
*
* */
//settings
//alarm sound, user custom?
//sleeping music volume change
//music from spotify, no <- open spotify app directly
//