import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './mainScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'newMainScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class UserPreference {
  //consist of user settings
  double volume = 0;
}

void main() {
  runApp(MaterialApp(
    home:DevicePage()));
}

class DevicePage extends StatefulWidget {
  const DevicePage({Key? key}) : super(key: key);
  State<StatefulWidget> createState(){
    return DevicePageState();
  }
}

class DevicePageState extends State<DevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        maxHeight: 400,
        renderPanelSheet: false,
        panel: _floatingPanel(),
        collapsed: _floatingCollapsed(),
        body: Center(
          child:
          Stack(
            children: [
              Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 1,

                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Page.png"),
                        fit: BoxFit.cover,
                      )
                  ),
                  child:
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(25, 300, 0, 4),
                      child:
                      Column(
                        //mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultTextStyle(
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  textStyle: TextStyle(fontSize: 45,
                                      color: Colors.white,
                                      letterSpacing: .5),
                                  decoration: TextDecoration.none),                              child: AnimatedTextKit(
                                animatedTexts: [
                                  WavyAnimatedText('SuperNap'),
                                ],
                                isRepeatingAnimation: true,
                                onTap: () {
                                  print("Tap Event");
                                },
                              ),
                            ),
                            Divider(
                              height: 5,
                              color: Colors.transparent,
                            ),
                            Text(
                              'Supercharging your Powernaps',
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  textStyle: TextStyle(fontSize: 15,
                                      color: Colors.white,
                                      letterSpacing: .5),
                                  decoration: TextDecoration.none),
                            ),
                          ]
                      )

                  )

              )


            ],
          ),
        ),
      ),
    );
  }

  Widget _floatingCollapsed() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Center(
        child:
        Center(child:
        Text('Getting Start Now!',
          style: GoogleFonts.quicksand(fontWeight: FontWeight.w600,
          textStyle: TextStyle(fontSize: 18,
          color: Color.fromRGBO(93, 95, 239, 1),
          letterSpacing: .5),
          decoration: TextDecoration.none),))
    ));
  }

  Widget _floatingPanel() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.transparent,
            ),
          ]
      ),
      margin: const EdgeInsets.all(24.0),
      child: Center(
        child:
        Center(child:
            Column(
              children: [
                Divider(height: 45,color: Colors.transparent,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text("     Discovering Devices            ",
                  style: GoogleFonts.quicksand(fontWeight: FontWeight.w600,
                      textStyle: TextStyle(fontSize: 20,
                          color: Colors.black,
                          letterSpacing: .5),
                      decoration: TextDecoration.none),
                ),
                    SpinKitWave(
                      size: 20,
                      color: Colors.black,
                    ),
                ],),

                Divider(height: 20,),

                Container(
                  width: 310,
                  height: 80,
                  decoration: BoxDecoration(
                    color:  Color.fromRGBO(246, 248, 251, 1),// fromRGBO(93, 95, 239, 1):
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:
                  Material(
                    color: Colors.transparent,
                    child:
                    InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder:(context)=>newMainScreen()));
                        });
                      },
                      child:
                      Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //title
                                Center(
                                  child:
                                  Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(25, 25, 0, 0),
                                    child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                image: DecorationImage(
                                                  image: AssetImage('assets/images/logo.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                            ),
                                            Text('   SNMask v1.024',
                                              style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 20, color:  Colors.black, letterSpacing: .5),),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
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

              ],
            )
        ),
      ),
    );
  }
}

