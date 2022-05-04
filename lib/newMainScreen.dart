import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:supernap/settingPage.dart';
import 'Sleeping.dart';
import 'main.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
class newMainScreen extends StatefulWidget{
  State<StatefulWidget> createState(){
    return newMainScreenState();
  }
}

class newMainScreenState extends State<newMainScreen> {

  AssetsAudioPlayer music_player = AssetsAudioPlayer();
  double m0vol = 50;
  double m1vol = 50;
  double m2vol = 50;
  double m3vol = 50;
  Color m0color = Colors.transparent;
  Color m1color = Colors.transparent;
  Color m2color = Colors.transparent;
  Color m3color = Colors.transparent;

  AssetsAudioPlayer nature_player = AssetsAudioPlayer();
  double n1vol = 50;
  double n2vol = 50;
  double n3vol = 50;
  Color n1color = Colors.transparent;
  Color n2color = Colors.transparent;
  Color n3color = Colors.transparent;

  AssetsAudioPlayer lecture_player = AssetsAudioPlayer();
  double l1vol = 50;
  double l2vol = 50;
  double l3vol = 50;
  Color l1color = Colors.transparent;
  Color l2color = Colors.transparent;
  Color l3color = Colors.transparent;

  AssetsAudioPlayer meditation_player = AssetsAudioPlayer();
  double d1vol = 50;
  double d2vol = 50;
  double d3vol = 50;
  Color d1color = Colors.transparent;
  Color d2color = Colors.transparent;
  Color d3color = Colors.transparent;

  AssetsAudioPlayer water_player = AssetsAudioPlayer();
  double t1vol = 50;
  double t2vol = 50;
  double t3vol = 50;
  Color t1color = Colors.transparent;
  Color t2color = Colors.transparent;
  Color t3color = Colors.transparent;

  bool mode1clicked = false;
  bool mode2clicked = false;
  bool t1clicked = false;
  bool t2clicked = false;
  bool t3clicked = false;
  bool t4clicked = false;
  static bool sunrisedAlarm = false;

  bool timeselected = false;
  String timeused1 = "5 secs";
  String timeused2 = "16 mins";
  String timeused3 = "24 mins";
  bool mode1 = true;

  int totoalminutes = 0;
  bool custom = false;
  static int hours = 0;
  static int minutes = 0;
  static int seconds = 0;

  String customString = 'Custom';
  TimeOfDay _time = TimeOfDay.now().replacing(hour: 11, minute: 30);
  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
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


    return SlidingUpPanel(
      backdropEnabled: true,
      maxHeight: 425,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      border: Border.all(
        color: Color.fromRGBO(93, 95, 239, 1),
        width: 3,
      ),
      body:
      MaterialApp(
          theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
          home:
          Scaffold(
              appBar:
              AppBar(
                  title: Text('SuperNap', style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w600,
                textStyle: TextStyle(
                    fontSize: 22, color: Colors.black, letterSpacing: .5),),),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                actions: <Widget>[
                  GestureDetector(
                    onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder:(context)=>settingPage()));
                      },
                    child:
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child:
                      Container(
                        height: 25,
                        child:
                        ImageIcon(
                          AssetImage("assets/images/sliders.png"),
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),

                  )
                ],

              ),
              body:
              SingleChildScrollView(
                child:
                Column(

                  children: [
                    //music
                    Divider(height: 1,),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                        child:
                        Column(children: [
                          Row(children: [
                            Text('Music',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,
                                textStyle: TextStyle(fontSize: 20, color: Colors
                                    .black, letterSpacing: .5),),
                            ), //time length module
                          ]),
                        ],)
                    ),
                    Container(
                      height: 108,
                      child:
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                              child:
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
                                  child:
                                  Container(
                                    width: 170,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/m0.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child:
                                    Material(
                                      color: Colors.transparent,
                                      child:
                                      InkWell(
                                        onTap: () {
                                          setState(() {

                                            m1vol=0;
                                            m2vol=0;
                                            m3vol=0;
                                            m0color = Colors.white;
                                            m1color = Colors.transparent;
                                            m2color = Colors.transparent;
                                            m3color = Colors.transparent;

                                            music_player.stop();
                                            custom_music();
                                            music_player.setVolume(0);
                                          });
                                        },
                                        child:
                                        Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  //title
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional.fromSTEB(14, 14, 0, 0),
                                                    child:
                                                    Text(
                                                      "Custom",
                                                      style: GoogleFonts.quicksand(
                                                        fontWeight: FontWeight.w700,
                                                        textStyle: TextStyle(fontSize: 15,
                                                            color: Colors.white,
                                                            letterSpacing: .5),),
                                                    ),
                                                  ),
                                                  //icon
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                        0, 10, 14, 0),
                                                    child:
                                                    Icon(CupertinoIcons.volume_up,
                                                      color:m0color, size: 18.0,),
                                                  )
                                                ],
                                              ),
                                              //slider
                                              Padding(
                                                  padding:
                                                  EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                                                  child:
                                                  Slider(
                                                    value: m0vol,
                                                    onChanged: (double newRating){
                                                      setState(() {
                                                        m0vol = newRating;
                                                        m1vol = 0;
                                                        m2vol=0;
                                                        m3vol=0;
                                                        music_player.setVolume(m0vol/100) ;
                                                      });
                                                    },
                                                    min: 0,
                                                    max: 100,
                                                    thumbColor: m0color,
                                                    activeColor: m0color,
                                                    inactiveColor: m0color,
                                                  )),
                                            ]
                                        ),
                                      ),
                                    ),
                                  )
                              )
                          ),

                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child:
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
                                  child:
                                  Container(
                                    width: 170,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/m1.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child:
                                    Material(
                                      color: Colors.transparent,
                                      child:
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            m2vol=0;
                                            m3vol=0;
                                            m0vol=0;
                                            m0color = Colors.transparent;
                                            m1color = Colors.white;
                                            m2color = Colors.transparent;
                                            m3color = Colors.transparent;
                                            music_player.stop();
                                            music_player.open(Audio('assets/sound/jazz.mp3'),showNotification: true);
                                            music_player.setVolume(0);
                                          });
                                        },
                                        child:
                                        Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  //title
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional.fromSTEB(14, 14, 0, 0),
                                                    child:
                                                    Text(
                                                      "Jazz",
                                                      style: GoogleFonts.quicksand(
                                                        fontWeight: FontWeight.w700,
                                                        textStyle: TextStyle(fontSize: 15,
                                                            color: Colors.white,
                                                            letterSpacing: .5),),
                                                    ),
                                                  ),
                                                  //icon
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                        0, 10, 14, 0),
                                                    child:
                                                    Icon(CupertinoIcons.volume_up,
                                                      color:m1color, size: 18.0,),
                                                  )
                                                ],
                                              ),
                                              //slider
                                              Padding(
                                                  padding:
                                                  EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                                                  child:
                                                  Slider(
                                                    value: m1vol,
                                                    onChanged: (double newRating){
                                                      setState(() {
                                                        m1vol = newRating;
                                                        m2vol=0;
                                                        m3vol=0;
                                                        music_player.setVolume(m1vol/100) ;
                                                      });
                                                    },
                                                    min: 0,
                                                    max: 100,
                                                    thumbColor: m1color,
                                                    activeColor: m1color,
                                                    inactiveColor: m1color,
                                                  )),
                                            ]
                                        ),
                                      ),
                                    ),
                                  )
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
                              child:
                              Container(
                                width: 170,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/m2.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:
                                Material(
                                  color: Colors.transparent,
                                  child:
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        m0vol=0;
                                        m0color = Colors.transparent;

                                        m1vol=0;
                                        m3vol=0;
                                        m1color = Colors.transparent;
                                        m2color = Colors.white;
                                        m3color = Colors.transparent;
                                        music_player.stop();
                                        music_player.open(Audio('assets/sound/piano.mp3'),showNotification: true);
                                        music_player.setVolume(0);
                                      });
                                    },
                                    child:
                                    Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              //title
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(14, 14, 0, 0),
                                                child:
                                                Text(
                                                  "Piano",
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w700,
                                                    textStyle: TextStyle(fontSize: 15,
                                                        color: Colors.white,
                                                        letterSpacing: .5),),
                                                ),
                                              ),
                                              //icon
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 14, 0),
                                                child:
                                                Icon(CupertinoIcons.volume_up,
                                                  color:m2color, size: 18.0,),
                                              )
                                            ],
                                          ),
                                          //slider
                                          Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                                              child:
                                              Slider(
                                                value: m2vol,
                                                onChanged: (double newRating){
                                                  setState(() {
                                                    m2vol = newRating;
                                                    m1vol = 0;
                                                    m3vol=0;
                                                    music_player.setVolume(m2vol/100) ;
                                                  });
                                                },
                                                min: 0,
                                                max: 100,
                                                thumbColor: m2color,
                                                activeColor: m2color,
                                                inactiveColor: m2color,
                                              )

                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
                              child:
                              Container(
                                width: 170,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/m3.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:
                                Material(
                                  color: Colors.transparent,
                                  child:
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        m0vol=0;
                                        m0color = Colors.transparent;

                                        m1vol=0;
                                        m2vol=0;
                                        m1color = Colors.transparent;
                                        m2color = Colors.transparent;
                                        m3color = Colors.white;
                                        music_player.stop();
                                        music_player.open(Audio('assets/sound/lofi.mp3'),showNotification: true);
                                        music_player.setVolume(0);

                                      });
                                    },
                                    child:
                                    Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              //title
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(14, 14, 0, 0),
                                                child:
                                                Text(
                                                  "LoFi",
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w700,
                                                    textStyle: TextStyle(fontSize: 15,
                                                        color: Colors.white,
                                                        letterSpacing: .5),),
                                                ),
                                              ),
                                              //icon
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 14, 0),
                                                child:
                                                Icon(CupertinoIcons.volume_up,
                                                  color:m3color, size: 18.0,),
                                              )
                                            ],
                                          ),
                                          //slider
                                          Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                                              child:
                                              Slider(
                                                value: m3vol,
                                                onChanged: (double newRating){
                                                  setState(() {
                                                    m3vol = newRating;
                                                    m1vol=0;m2vol=0;
                                                    music_player.setVolume(m3vol/100) ;
                                                  });
                                                },
                                                min: 0,
                                                max: 100,
                                                thumbColor: m3color,
                                                activeColor: m3color,
                                                inactiveColor: m3color,
                                              )

                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),

                    //nature
                    Padding(
                        padding: EdgeInsets.fromLTRB(20,10,0,5),
                        child:
                        Column(children: [
                          Row(children: [
                            Text('Nature',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: .5),),
                            ), //time length module
                          ]),
                        ],)
                    ),
                    Container(
                      height: 108,
                      child:
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                              child:
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
                                  child:
                                  Container(
                                    width: 170,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/n1.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child:
                                    Material(
                                      color: Colors.transparent,
                                      child:
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            n2vol=0;
                                            n3vol=0;
                                            n1color = Colors.white;
                                            n2color = Colors.transparent;
                                            n3color = Colors.transparent;
                                            nature_player.stop();
                                            nature_player.open(Audio('assets/sound/forest.mp3'),showNotification: true);
                                            nature_player.setVolume(0);
                                          });
                                        },
                                        child:
                                        Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  //title
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional.fromSTEB(14, 14, 0, 0),
                                                    child:
                                                    Text(
                                                      "Forest",
                                                      style: GoogleFonts.quicksand(
                                                        fontWeight: FontWeight.w700,
                                                        textStyle: TextStyle(fontSize: 15,
                                                            color: Colors.white,
                                                            letterSpacing: .5),),
                                                    ),
                                                  ),
                                                  //icon
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                        0, 10, 14, 0),
                                                    child:
                                                    Icon(CupertinoIcons.volume_up,
                                                      color:n1color, size: 18.0,),
                                                  )
                                                ],
                                              ),
                                              //slider
                                              Padding(
                                                  padding:
                                                  EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                                                  child:
                                                  Slider(
                                                    value: n1vol,
                                                    onChanged: (double newRating){
                                                      setState(() {
                                                        n1vol = newRating;
                                                        n2vol=0;
                                                        n3vol=0;
                                                        nature_player.setVolume(n1vol/100) ;
                                                      });
                                                    },
                                                    min: 0,
                                                    max: 100,
                                                    thumbColor: n1color,
                                                    activeColor: n1color,
                                                    inactiveColor: n1color,
                                                  )),
                                            ]
                                        ),
                                      ),
                                    ),
                                  )
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
                              child:
                              Container(
                                width: 170,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/n2.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:
                                Material(
                                  color: Colors.transparent,
                                  child:
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        n1vol=0;
                                        n3vol=0;
                                        n1color = Colors.transparent;
                                        n2color = Colors.white;
                                        n3color = Colors.transparent;
                                        nature_player.stop();
                                        nature_player.open(Audio('assets/sound/rain.mp3'),showNotification: true);
                                        nature_player.setVolume(0);
                                      });
                                    },
                                    child:
                                    Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              //title
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(14, 14, 0, 0),
                                                child:
                                                Text(
                                                  "Light Rain",
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w700,
                                                    textStyle: TextStyle(fontSize: 15,
                                                        color: Colors.white,
                                                        letterSpacing: .5),),
                                                ),
                                              ),
                                              //icon
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 14, 0),
                                                child:
                                                Icon(CupertinoIcons.volume_up,
                                                  color:n2color, size: 18.0,),
                                              )
                                            ],
                                          ),
                                          //slider
                                          Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                                              child:
                                              Slider(
                                                value: n2vol,
                                                onChanged: (double newRating){
                                                  setState(() {
                                                    n2vol = newRating;
                                                    n1vol = 0;
                                                    n3vol=0;
                                                    nature_player.setVolume(n2vol/100) ;
                                                  });
                                                },
                                                min: 0,
                                                max: 100,
                                                thumbColor: n2color,
                                                activeColor: n2color,
                                                inactiveColor: n2color,
                                              )

                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                              )
                          ),

                          //buildMusic("LoFi", "assets/images/m3.png", 'm3vol'),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
                              child:
                              Container(
                                width: 170,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/n3.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:
                                Material(
                                  color: Colors.transparent,
                                  child:
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        n1vol=0;
                                        n2vol=0;
                                        n1color = Colors.transparent;
                                        n2color = Colors.transparent;
                                        n3color = Colors.white;
                                        nature_player.stop();
                                        nature_player.open(Audio('assets/sound/Campfire_by_the_River.mp3'),showNotification: true);
                                        nature_player.setVolume(0);

                                      });
                                    },
                                    child:
                                    Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              //title
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(14, 14, 0, 0),
                                                child:
                                                Text(
                                                  "Campfire",
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w700,
                                                    textStyle: TextStyle(fontSize: 15,
                                                        color: Colors.white,
                                                        letterSpacing: .5),),
                                                ),
                                              ),
                                              //icon
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 14, 0),
                                                child:
                                                Icon(CupertinoIcons.volume_up,
                                                  color:n3color, size: 18.0,),
                                              )
                                            ],
                                          ),
                                          //slider
                                          Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                                              child:
                                              Slider(
                                                value: n3vol,
                                                onChanged: (double newRating){
                                                  setState(() {
                                                    n3vol = newRating;
                                                    n1vol=0;n2vol=0;
                                                    nature_player.setVolume(n3vol/100) ;
                                                  });
                                                },
                                                min: 0,
                                                max: 100,
                                                thumbColor: n3color,
                                                activeColor: n3color,
                                                inactiveColor: n3color,
                                              )

                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                              )
                          ),

                        ],
                      ),
                    ),

                    //lecture
                    Padding(
                        padding: EdgeInsets.fromLTRB(20,10,0,5),
                        child:
                        Column(children: [
                          Row(children: [
                            Text('Lecture',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: .5),),
                            ), //time length module
                          ]),
                        ],)
                    ),
                    Container(
                      height: 108,
                      child:
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                              child:
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
                                  child:
                                  Container(
                                    width: 170,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/l1.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child:
                                    Material(
                                      color: Colors.transparent,
                                      child:
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            l2vol=0;
                                            l3vol=0;
                                            l1color = Colors.white;
                                            l2color = Colors.transparent;
                                            l3color = Colors.transparent;
                                            lecture_player.stop();
                                            lecture_player.open(Audio('assets/sound/maths.mp3'),showNotification: true);
                                            lecture_player.setVolume(0);
                                          });
                                        },
                                        child:
                                        Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  //title
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional.fromSTEB(14, 14, 0, 0),
                                                    child:
                                                    Text(
                                                      "Maths",
                                                      style: GoogleFonts.quicksand(
                                                        fontWeight: FontWeight.w700,
                                                        textStyle: TextStyle(fontSize: 15,
                                                            color: Colors.white,
                                                            letterSpacing: .5),),
                                                    ),
                                                  ),
                                                  //icon
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                        0, 10, 14, 0),
                                                    child:
                                                    Icon(CupertinoIcons.volume_up,
                                                      color:l1color, size: 18.0,),
                                                  )
                                                ],
                                              ),
                                              //slider
                                              Padding(
                                                  padding:
                                                  EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                                                  child:
                                                  Slider(
                                                    value: l1vol,
                                                    onChanged: (double newRating){
                                                      setState(() {
                                                        l1vol = newRating;
                                                        l2vol=0;
                                                        l3vol=0;
                                                        lecture_player.setVolume(l1vol/100) ;
                                                      });
                                                    },
                                                    min: 0,
                                                    max: 100,
                                                    thumbColor: l1color,
                                                    activeColor: l1color,
                                                    inactiveColor: l1color,
                                                  )),
                                            ]
                                        ),
                                      ),
                                    ),
                                  )
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
                              child:
                              Container(
                                width: 170,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/l2.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:
                                Material(
                                  color: Colors.transparent,
                                  child:
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        l1vol=0;
                                        l3vol=0;
                                        l1color = Colors.transparent;
                                        l2color = Colors.white;
                                        l3color = Colors.transparent;
                                        lecture_player.stop();
                                        lecture_player.open(Audio('assets/sound/history.mp3'),showNotification: true);
                                        lecture_player.setVolume(0);
                                      });
                                    },
                                    child:
                                    Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              //title
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(14, 14, 0, 0),
                                                child:
                                                Text(
                                                  "History",
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w700,
                                                    textStyle: TextStyle(fontSize: 15,
                                                        color: Colors.white,
                                                        letterSpacing: .5),),
                                                ),
                                              ),
                                              //icon
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 14, 0),
                                                child:
                                                Icon(CupertinoIcons.volume_up,
                                                  color:l2color, size: 18.0,),
                                              )
                                            ],
                                          ),
                                          //slider
                                          Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                                              child:
                                              Slider(
                                                value: l2vol,
                                                onChanged: (double newRating){
                                                  setState(() {
                                                    l2vol = newRating;
                                                    l1vol = 0;
                                                    l3vol=0;
                                                    lecture_player.setVolume(l2vol/100) ;
                                                  });
                                                },
                                                min: 0,
                                                max: 100,
                                                thumbColor: l2color,
                                                activeColor: l2color,
                                                inactiveColor: l2color,
                                              )

                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                              )
                          ),

                          //buildMusic("LoFi", "assets/images/m3.png", 'm3vol'),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
                              child:
                              Container(
                                width: 170,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/l3.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:
                                Material(
                                  color: Colors.transparent,
                                  child:
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        l1vol=0;
                                        l2vol=0;
                                        l1color = Colors.transparent;
                                        l2color = Colors.transparent;
                                        l3color = Colors.white;
                                        lecture_player.stop();
                                        lecture_player.open(Audio('assets/sound/doc.mp3'),showNotification: true);
                                        lecture_player.setVolume(0);

                                      });
                                    },
                                    child:
                                    Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              //title
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(14, 14, 0, 0),
                                                child:
                                                Text(
                                                  "Software",
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w700,
                                                    textStyle: TextStyle(fontSize: 15,
                                                        color: Colors.white,
                                                        letterSpacing: .5),),
                                                ),
                                              ),
                                              //icon
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 14, 0),
                                                child:
                                                Icon(CupertinoIcons.volume_up,
                                                  color:l3color, size: 18.0,),
                                              )
                                            ],
                                          ),
                                          //slider
                                          Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                                              child:
                                              Slider(
                                                value: l3vol,
                                                onChanged: (double newRating){
                                                  setState(() {
                                                    l3vol = newRating;
                                                    l1vol=0;l2vol=0;
                                                    lecture_player.setVolume(l3vol/100) ;
                                                  });
                                                },
                                                min: 0,
                                                max: 100,
                                                thumbColor: l3color,
                                                activeColor: l3color,
                                                inactiveColor: l3color,
                                              )

                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                              )
                          ),

                        ],
                      ),
                    ),

                    //meditation
                    Padding(
                        padding: EdgeInsets.fromLTRB(20,10,0,5),
                        child:
                        Column(children: [
                          Row(children: [
                            Text('Meditation',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: .5),),
                            ), //time length module
                          ]),
                        ],)
                    ),
                    Container(
                      height: 108,
                      child:
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                              child:
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
                                  child:
                                  Container(
                                    width: 170,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/d1.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child:
                                    Material(
                                      color: Colors.transparent,
                                      child:
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            d2vol=0;
                                            d3vol=0;
                                            d1color = Colors.white;
                                            d2color = Colors.transparent;
                                            d3color = Colors.transparent;
                                            meditation_player.stop();
                                            meditation_player.open(Audio('assets/sound/Alpha_Waves.mp3'),showNotification: true);
                                            meditation_player.setVolume(0);
                                          });
                                        },
                                        child:
                                        Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  //title
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional.fromSTEB(14, 14, 0, 0),
                                                    child:
                                                    Text(
                                                      "Alpha",
                                                      style: GoogleFonts.quicksand(
                                                        fontWeight: FontWeight.w700,
                                                        textStyle: TextStyle(fontSize: 15,
                                                            color: Colors.white,
                                                            letterSpacing: .5),),
                                                    ),
                                                  ),
                                                  //icon
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                        0, 10, 14, 0),
                                                    child:
                                                    Icon(CupertinoIcons.volume_up,
                                                      color:d1color, size: 18.0,),
                                                  )
                                                ],
                                              ),
                                              //slider
                                              Padding(
                                                  padding:
                                                  EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                                                  child:
                                                  Slider(
                                                    value: d1vol,
                                                    onChanged: (double newRating){
                                                      setState(() {
                                                        d1vol = newRating;
                                                        d2vol=0;
                                                        d3vol=0;
                                                        meditation_player.setVolume(d1vol/100) ;
                                                      });
                                                    },
                                                    min: 0,
                                                    max: 100,
                                                    thumbColor: d1color,
                                                    activeColor: d1color,
                                                    inactiveColor: d1color,
                                                  )),
                                            ]
                                        ),
                                      ),
                                    ),
                                  )
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
                              child:
                              Container(
                                width: 170,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/d2.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:
                                Material(
                                  color: Colors.transparent,
                                  child:
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        d1vol=0;
                                        d3vol=0;
                                        d1color = Colors.transparent;
                                        d2color = Colors.white;
                                        d3color = Colors.transparent;
                                        meditation_player.stop();
                                        meditation_player.open(Audio('assets/sound/Delta_Waves.mp3'),showNotification: true);
                                        meditation_player.setVolume(0);
                                      });
                                    },
                                    child:
                                    Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              //title
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(14, 14, 0, 0),
                                                child:
                                                Text(
                                                  "Delta",
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w700,
                                                    textStyle: TextStyle(fontSize: 15,
                                                        color: Colors.white,
                                                        letterSpacing: .5),),
                                                ),
                                              ),
                                              //icon
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 14, 0),
                                                child:
                                                Icon(CupertinoIcons.volume_up,
                                                  color:d2color, size: 18.0,),
                                              )
                                            ],
                                          ),
                                          //slider
                                          Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                                              child:
                                              Slider(
                                                value: d2vol,
                                                onChanged: (double newRating){
                                                  setState(() {
                                                    d2vol = newRating;
                                                    d1vol = 0;
                                                    d3vol=0;
                                                    meditation_player.setVolume(d2vol/100) ;
                                                  });
                                                },
                                                min: 0,
                                                max: 100,
                                                thumbColor: d2color,
                                                activeColor: d2color,
                                                inactiveColor: d2color,
                                              )

                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                              )
                          ),

                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
                              child:
                              Container(
                                width: 170,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/d3.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:
                                Material(
                                  color: Colors.transparent,
                                  child:
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        d1vol=0;
                                        d2vol=0;
                                        d1color = Colors.transparent;
                                        d2color = Colors.transparent;
                                        d3color = Colors.white;
                                        meditation_player.stop();
                                        meditation_player.open(Audio('assets/sound/Theta_Waves.mp3'),showNotification: true);
                                        meditation_player.setVolume(0);

                                      });
                                    },
                                    child:
                                    Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              //title
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(14, 14, 0, 0),
                                                child:
                                                Text(
                                                  "Theta",
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w700,
                                                    textStyle: TextStyle(fontSize: 15,
                                                        color: Colors.white,
                                                        letterSpacing: .5),),
                                                ),
                                              ),
                                              //icon
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 14, 0),
                                                child:
                                                Icon(CupertinoIcons.volume_up,
                                                  color:d3color, size: 18.0,),
                                              )
                                            ],
                                          ),
                                          //slider
                                          Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                                              child:
                                              Slider(
                                                value: d3vol,
                                                onChanged: (double newRating){
                                                  setState(() {
                                                    d3vol = newRating;
                                                    d1vol=0;d2vol=0;
                                                    meditation_player.setVolume(d3vol/100) ;
                                                  });
                                                },
                                                min: 0,
                                                max: 100,
                                                thumbColor: d3color,
                                                activeColor: d3color,
                                                inactiveColor: d3color,
                                              )

                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                              )
                          ),

                        ],
                      ),
                    ),

                    //water
                    Padding(
                        padding: EdgeInsets.fromLTRB(20,10,0,5),
                        child:
                        Column(children: [
                          Row(children: [
                            Text('Water',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: .5),),
                            ), //time length module
                          ]),
                        ],)
                    ),
                    Container(
                      height: 108,
                      child:
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                              child:
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
                                  child:
                                  Container(
                                    width: 170,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/t1.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child:
                                    Material(
                                      color: Colors.transparent,
                                      child:
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            t2vol=0;
                                            t3vol=0;
                                            t1color = Colors.white;
                                            t2color = Colors.transparent;
                                            t3color = Colors.transparent;
                                            water_player.stop();
                                            water_player.open(Audio('assets/sound/Under_Water.mp3'),showNotification: true);
                                            water_player.setVolume(0);
                                          });
                                        },
                                        child:
                                        Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  //title
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional.fromSTEB(14, 14, 0, 0),
                                                    child:
                                                    Text(
                                                      "Under Water",
                                                      style: GoogleFonts.quicksand(
                                                        fontWeight: FontWeight.w700,
                                                        textStyle: TextStyle(fontSize: 15,
                                                            color: Colors.white,
                                                            letterSpacing: .5),),
                                                    ),
                                                  ),
                                                  //icon
                                                  Padding(
                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                        0, 10, 14, 0),
                                                    child:
                                                    Icon(CupertinoIcons.volume_up,
                                                      color:t1color, size: 18.0,),
                                                  )
                                                ],
                                              ),
                                              //slider
                                              Padding(
                                                  padding:
                                                  EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                                                  child:
                                                  Slider(
                                                    value: t1vol,
                                                    onChanged: (double newRating){
                                                      setState(() {
                                                        t1vol = newRating;
                                                        t2vol=0;
                                                        t3vol=0;
                                                        water_player.setVolume(t1vol/100) ;
                                                      });
                                                    },
                                                    min: 0,
                                                    max: 100,
                                                    thumbColor: t1color,
                                                    activeColor: t1color,
                                                    inactiveColor: t1color,
                                                  )),
                                            ]
                                        ),
                                      ),
                                    ),
                                  )
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
                              child:
                              Container(
                                width: 170,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/t2.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:
                                Material(
                                  color: Colors.transparent,
                                  child:
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        t1vol=0;
                                        t3vol=0;
                                        t1color = Colors.transparent;
                                        t2color = Colors.white;
                                        t3color = Colors.transparent;
                                        water_player.stop();
                                        water_player.open(Audio('assets/sound/Waterfall.mp3'),showNotification: true);
                                        water_player.setVolume(0);
                                      });
                                    },
                                    child:
                                    Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              //title
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(14, 14, 0, 0),
                                                child:
                                                Text(
                                                  "Waterfall",
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w700,
                                                    textStyle: TextStyle(fontSize: 15,
                                                        color: Colors.white,
                                                        letterSpacing: .5),),
                                                ),
                                              ),
                                              //icon
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 14, 0),
                                                child:
                                                Icon(CupertinoIcons.volume_up,
                                                  color:t2color, size: 18.0,),
                                              )
                                            ],
                                          ),
                                          //slider
                                          Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                                              child:
                                              Slider(
                                                value: t2vol,
                                                onChanged: (double newRating){
                                                  setState(() {
                                                    t2vol = newRating;
                                                    t1vol = 0;
                                                    t3vol=0;
                                                    water_player.setVolume(t2vol/100) ;
                                                  });
                                                },
                                                min: 0,
                                                max: 100,
                                                thumbColor: t2color,
                                                activeColor: t2color,
                                                inactiveColor: t2color,
                                              )

                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 8, 0),
                              child:
                              Container(
                                width: 170,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/t3.png'),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:
                                Material(
                                  color: Colors.transparent,
                                  child:
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        t1vol=0;
                                        t2vol=0;
                                        t1color = Colors.transparent;
                                        t2color = Colors.transparent;
                                        t3color = Colors.white;
                                        water_player.stop();
                                        water_player.open(Audio('assets/sound/Ocean.mp3'),showNotification: true);
                                        water_player.setVolume(0);

                                      });
                                    },
                                    child:
                                    Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              //title
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(14, 14, 0, 0),
                                                child:
                                                Text(
                                                  "Ocean",
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.w700,
                                                    textStyle: TextStyle(fontSize: 15,
                                                        color: Colors.white,
                                                        letterSpacing: .5),),
                                                ),
                                              ),
                                              //icon
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 14, 0),
                                                child:
                                                Icon(CupertinoIcons.volume_up,
                                                  color:t3color, size: 18.0,),
                                              )
                                            ],
                                          ),
                                          //slider
                                          Padding(
                                              padding:
                                              EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                                              child:
                                              Slider(
                                                value: t3vol,
                                                onChanged: (double newRating){
                                                  setState(() {
                                                    t3vol = newRating;
                                                    t1vol=0;t2vol=0;
                                                    water_player.setVolume(t3vol/100) ;
                                                  });
                                                },
                                                min: 0,
                                                max: 100,
                                                thumbColor: t3color,
                                                activeColor: t3color,
                                                inactiveColor: t3color,
                                              )
                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                              )
                          ),

                        ],
                      ),
                    ),

                    //bottom empty space
                    Divider(height: 120, color: Colors.transparent,),

                  ],
                ),
              )
          )),

      //buttom sheet expanded
      panel:
      Column(
        mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
        crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,

        children: [
          Divider(height: 10,color: Colors.transparent,),
          Icon(Icons.keyboard_arrow_down_rounded , color: Color.fromRGBO(93, 95, 239, 1), size: 25.0,),

          //Mode
          Padding(
              padding: EdgeInsets.fromLTRB(20,0,0,0),
              child:
                Row(children: [
                  Text('Mode',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w800,textStyle: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: .5),decoration: TextDecoration.none),
                  )
                ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20,15,20,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 184,
                  height: 90,
                  decoration: BoxDecoration(
                    color: mode1clicked? Color.fromRGBO(93, 95, 239, 1): Color.fromRGBO(246, 248, 251, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                  Material(
                    color: Colors.transparent,
                    child:
                    InkWell(
                      onTap: () {
                        setState(() {
                          //quick nap clicked
                          mode1clicked = true;
                          mode2clicked = false;
                          timeused1 = "5 secs";
                          timeused2 = "16 mins";
                          timeused3 = "24 mins";
                          mode1 = true;

                        });
                      },
                      child:
                      Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //title
                                Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                                  child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                    crossAxisAlignment: CrossAxisAlignment.start, //Center Row contents vertically,

                                    children: [
                                      Text(
                                        "Quick Nap",
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w600,
                                          textStyle: TextStyle(fontSize: 18,
                                              color: mode1clicked? Colors.white: Colors.black,
                                              letterSpacing: .5),),
                                      ),
                                      Divider(height: 10,color:Colors.black),

                                      Row(
                                        children: [
                                          Icon(Icons.access_alarm ,
                                            color: mode1clicked? Colors.white: Colors.grey, size: 15,),
                                          Text(' 5 - 25 mins',
                                            style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 10, color: mode1clicked? Colors.white: Colors.grey, letterSpacing: .5),),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                //icon
                              ],
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 184,
                  height: 90,
                  decoration: BoxDecoration(
                    color: mode2clicked? Color.fromRGBO(93, 95, 239, 1):Color.fromRGBO(246, 248, 251, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                  Material(
                    color: Colors.transparent,
                    child:
                    InkWell(
                      onTap: () {
                        setState(() {
                          mode2clicked = true;
                          mode1clicked = false;
                          timeused1 = "6 hrs";
                          timeused2 = "8 hrs";
                          timeused3 = "10 hrs";
                          mode1 = false;
                        });
                      },
                      child:
                      Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //title
                                Padding(
                                  padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                                  child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                                    crossAxisAlignment: CrossAxisAlignment.start, //Center Row contents vertically,

                                    children: [
                                      Text(
                                        "Deep Sleep",
                                        style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w600,
                                          textStyle: TextStyle(fontSize: 18,
                                              color: mode2clicked? Colors.white: Colors.black,
                                              letterSpacing: .5),),
                                      ),
                                      Divider(height: 10,color:Colors.transparent),

                                      Row(
                                        children: [
                                          Icon(Icons.access_alarm , color: mode2clicked? Colors.white: Colors.grey, size: 15,),
                                          Text(' 4 - 8 hours',
                                            style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 10, color: mode2clicked? Colors.white: Colors.grey, letterSpacing: .5),),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ]
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Time length
          Padding(
            padding: EdgeInsets.fromLTRB(20,20,0,0),
            child:
            Row(children: [
              Text('Time Length',
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w800,textStyle: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: .5),decoration: TextDecoration.none),
              )
            ]),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20,15,20,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 90,
                  height: 50,
                  decoration: BoxDecoration(
                    color: t1clicked? Color.fromRGBO(93, 95, 239, 1): Color.fromRGBO(246, 248, 251, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                  Material(
                    color: Colors.transparent,
                    child:
                    InkWell(
                        onTap: () {
                          setState(() {
                            t1clicked = true;
                            t2clicked = false;
                            t3clicked = false;
                            t4clicked = false;
                            timeselected = true;

                            if(mode1) {
                              hours = 0; minutes = 0; seconds = 5;
                              custom = false;
                            }
                            else {
                              hours = 6; minutes = 0; seconds = 0;
                              custom = false;
                            }

                          });
                        },
                        child:
                        Center(
                          child:
                          Text(
                            timeused1,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(fontSize: 15,
                                  color: t1clicked? Colors.white: Colors.black,
                                  letterSpacing: .5),),
                          ),
                        )
                    ),
                  ),
                ),
                Container(
                  width: 90,
                  height: 50,
                  decoration: BoxDecoration(
                    color: t2clicked? Color.fromRGBO(93, 95, 239, 1): Color.fromRGBO(246, 248, 251, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                  Material(
                    color: Colors.transparent,
                    child:
                    InkWell(
                        onTap: () {
                          setState(() {
                            timeselected = true;
                            t1clicked = false;
                            t2clicked = true;
                            t3clicked = false;
                            t4clicked = false;
                            if(mode1) {
                              hours = 0; minutes = 16; seconds = 0;
                              custom = false;
                            }
                            else {
                              hours = 8; minutes = 0; seconds = 0;
                              custom = false;
                            }

                          });
                        },
                        child:
                        Center(
                          child:
                          Text(
                            timeused2,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(fontSize: 15,
                                  color: t2clicked? Colors.white: Colors.black,
                                  letterSpacing: .5),),
                          ),
                        )
                    ),
                  ),
                ),
                Container(
                  width: 90,
                  height: 50,
                  decoration: BoxDecoration(
                    color: t3clicked? Color.fromRGBO(93, 95, 239, 1): Color.fromRGBO(246, 248, 251, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                  Material(
                    color: Colors.transparent,
                    child:
                    InkWell(
                        onTap: () {
                          setState(() {
                            timeselected = true;
                            t1clicked = false;
                            t2clicked = false;
                            t3clicked = true;
                            t4clicked = false;
                            if(mode1) {
                              hours = 0; minutes = 24; seconds = 0;
                              custom = false;
                            }
                            else {
                              hours = 10; minutes = 0; seconds = 0;
                              custom = false;
                            }

                          });
                        },
                        child:
                        Center(
                          child:
                          Text(
                            timeused3,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(fontSize: 15,
                                  color: t3clicked? Colors.white: Colors.black,
                                  letterSpacing: .5),),
                          ),
                        )
                    ),
                  ),
                ),
                Container(
                  width: 90,
                  height: 50,
                  decoration: BoxDecoration(
                    color: t4clicked? Color.fromRGBO(93, 95, 239, 1): Color.fromRGBO(246, 248, 251, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                  Material(
                    color: Colors.transparent,
                    child:
                    InkWell(
                        onTap: () {
                          setState(() {
                            timeselected = true;
                            t1clicked = false;
                            t2clicked = false;
                            t3clicked = false;
                            t4clicked = true;
                            custom = true;
                            Navigator.of(context).push(
                              showPicker(
                                context: context,
                                value: _time,
                                onChange: onTimeChanged,
                              ),
                            );


                          });
                        },
                        child:
                        Center(
                          child:
                          Text(
                            "$customString",
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(fontSize: 15,
                                  color: t4clicked? Colors.white: Colors.black,
                                  letterSpacing: .5),),
                          ),
                        )
                    ),
                  ),
                ),

              ],
            ),
          ),

          //sunrise alarm
          Padding(
            padding: EdgeInsets.fromLTRB(20,20,0,25),
            child:
            Row(children: [
              Text('Sunrise Alarm',
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w800,textStyle: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: .5),decoration: TextDecoration.none),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(160,0,0,0),
                child:
                CrazySwitch(),
              ),
            ],),
          ),

          //sleeping button
          Padding(
              padding: EdgeInsets.fromLTRB(0,0,0,0),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.end, //Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.end, //Center Row contents vertically,
                children: [
                ElevatedButton.icon(
                  onPressed: (){
                    print("here to sleep");
                    startSleeping();
                  },
                  icon:
                  Icon(CupertinoIcons.play , color: Colors.white, size: 17.0,),
                  label: Text('Nap',
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700,textStyle: TextStyle(fontSize: 18, color: Colors.white, letterSpacing: .5),),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),),
                      primary: Color.fromRGBO(93, 95, 239, 1),
                      elevation: 0,
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.9,50)
                  ),
                ),

              ],)
          ),

        ],
      ),
      //buttom sheet collapsed
      collapsed:
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0),bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40.0))
        ),

        child: Center(
          child: Column(
            children: [
              Center(
                heightFactor: 0.9,
                child:
                Icon(Icons.keyboard_arrow_up_rounded , color: Color.fromRGBO(93, 95, 239, 1), size: 25.0,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.start, //Center Row contents vertically,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                          crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                          children: [
                            Icon(CupertinoIcons.clock , color: Colors.black, size: 17.0,),
                            Text(' ', style: GoogleFonts.quicksand(fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 17, color: Colors.black, letterSpacing: .5),decoration: TextDecoration.none),),
                            Text(timeselected? custom? '$customString': t1clicked? timeused1: t2clicked? timeused2: timeused3:'Select Time ~',
                              style: GoogleFonts.quicksand(fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 17, color: Colors.black, letterSpacing: .5),decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                        Divider(height: 5.5,color: Colors.transparent,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                          crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                          children: [
                            Icon(newMainScreenState.sunrisedAlarm? CupertinoIcons.bell : CupertinoIcons.bell_slash , color: Color.fromRGBO(93, 95, 239, 0.9), size: 17.0,),
                            Text(newMainScreenState.sunrisedAlarm?  " Sunrise Alarm is oned": " Sunrise Alarm is offed",
                              style: GoogleFonts.quicksand(fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 13, color: Color.fromRGBO(93, 95, 239, 0.9), letterSpacing: .5),decoration: TextDecoration.none),
                            ),
                          ],
                        ),
                      ],),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child:
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Color.fromRGBO(93, 95, 239, 1),elevation: 0),
                      child:Row(
                        children: [
                        Icon(CupertinoIcons.play , color: Colors.white, size: 17.0,),
                        Text(' Nap',
                          style: GoogleFonts.quicksand(fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 13, color: Colors.white, letterSpacing: .5),decoration: TextDecoration.none),
                        ),
                      ],),
                      onPressed: (){
                        startSleeping();
                      },
                    ),
                  )
                ],
              )
            ],
          )
        ),
      ),
    );
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


  void custom_music() async{
    print("hered");
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path.toString());
      print("asadsadasdasd");
      print(file.toString());
      music_player.open(
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
            color: isChecked ? Color.fromRGBO(93, 95, 239, 0.9) : Colors.blueGrey,
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
                      newMainScreenState.sunrisedAlarm= isChecked;
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
