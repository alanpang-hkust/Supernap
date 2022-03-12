import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'mainScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class Sleeping extends StatefulWidget {
  const Sleeping({Key? key}) : super(key: key);
  State<StatefulWidget> createState(){
    return SleepingState();
  }
}

class SleepingState extends State<Sleeping> {

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
        coundownDuration = Duration(hours: mainScreenState.hours, minutes: mainScreenState.minutes,seconds: mainScreenState.seconds);
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
        if(mainScreenState.sunrisedAlarm){
          print("time out, finish sleep"); //when countdown ends
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
    mainScreenState.sunrisedAlarm = false;
    Navigator.push(context,
        MaterialPageRoute(builder:(context)=>mainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white, //background color of canvas
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
          ),
          child: InkWell(
            onTap: () async {},
            child:
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Divider(
                  height: 180,
                  color: Colors.transparent,
                ),
                Text(
                  'Enjoy Your Sleep',
                    style: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 30, color: Colors.black, letterSpacing: .5),),
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
                      fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 15, color: Colors.black, letterSpacing: .5),),
                  ),
                ),
                Divider(
                  height: 150,
                  color: Colors.transparent,
                ),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFFF5F5F5),
                  child:Column(
                    children: [
                    //Text('Sound: ${mainScreenState.sound}'),
                    buildTime(),
                    if (mainScreenState.sunrisedAlarm )
                      Row(mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: [
                        Icon(Icons.alarm_on, color: Colors.black,size: 15,),
                        Text('  Alarm Oned',
                          style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 12, color: Colors.black, letterSpacing: .5),),
                        ),
                    ],)
                  ],),
                ),
                Divider(
                  height: 150,
                  color: Colors.transparent,
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: ElevatedButton.icon(
                    label: Text('Stop',
                      style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 15, color: Colors.black, letterSpacing: .5),),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: Size(100,30)
                    ),
                    onPressed: () { leaveSleepingPage();},
                    icon: Icon(Icons.pause, size: 12,color: Colors.black,),
                  ),
                ),
              ],
            ),
          ),
      ),
    );


  }

  Widget buildTime(){
      String twoDigits(int n)=> n.toString().padLeft(2,'0');
      final hours = twoDigits(duration.inHours.remainder(60));
      final minutes = twoDigits(duration.inMinutes.remainder(60));
      final seconds = twoDigits(duration.inSeconds.remainder(60));

      return Text(
        '$hours:$minutes:$seconds',
        style: GoogleFonts.quicksand(
          fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 80, color: Colors.black, letterSpacing: .5),),

    );
  }
}

