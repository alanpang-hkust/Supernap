import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:supernap/mainScreen.dart';
import 'alarm.dart';
import 'newMainScreen.dart';
import 'main.dart';
class settingPage extends StatefulWidget {
  const settingPage({Key? key}) : super(key: key);
  State<StatefulWidget> createState(){
    return settingPageState();
  }
}

class settingPageState extends State<settingPage> {

  @override
  void initState(){
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar:
      AppBar(
        title: Text('Settings', style: GoogleFonts.quicksand(
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
                IconButton(
                  icon: Icon(
                    Icons.keyboard_return,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder:(context)=>newMainScreen()));
                  },
                ),
              ),
            ),

          )
        ],

      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            // user card

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
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
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:
                    InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder:(context)=>DevicePage()));
                        },
                        child:
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                    ),

                  ),
                ],
              ),


            ),


            SettingsGroup(
              items: [
                SettingsItem(
                  icons: Icons.edit,
                  iconStyle: IconStyle(
                    iconsColor: Colors.black,
                    withBackground: true,
                    backgroundColor: Colors.white,
                  ),
                    title: "Modify",
                    subtitle: "Tap to change your data",
                    onTap: () {
                      print("OK");
                    },
                  ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.pencil_outline,
                  iconStyle: IconStyle(
                    iconsColor: Colors.black,
                    withBackground: true,
                    backgroundColor: Colors.white,
                  ),
                  title: 'Device setting',
                  subtitle: "Custom your setting",
                ),

                SettingsItem(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder:(context)=>alarm()));
                  },
                  icons: CupertinoIcons.music_albums,
                  iconStyle: IconStyle(
                    iconsColor: Colors.black,
                    withBackground: true,
                    backgroundColor: Colors.white,
                  ),
                  title: 'Alarm Sound',
                  subtitle: 'Change your alarm sound here',
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.fingerprint,
                  iconStyle: IconStyle(
                    iconsColor: Colors.black,
                    withBackground: true,
                    backgroundColor: Colors.white,
                  ),
                  title: 'Privacy',
                  subtitle: "Some privacy policy",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.dark_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.black,
                    withBackground: true,
                    backgroundColor: Colors.white,
                  ),
                  title: 'Dark mode',
                  subtitle: "Automatic",
                  trailing: Switch.adaptive(
                    value: false,
                    onChanged: (value){
                      value = true;
                    },
                  ),

                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.black,
                    withBackground: true,
                    backgroundColor: Colors.white,
                  ),
                  title: 'About',
                  subtitle: "Learn more about SuperNap",
                ),
              ],
            ),]
            // You can add a settings title,
        ),
      ),
    );
  }
}