import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'mainScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'settingPage.dart';

class alarm extends StatefulWidget {
  const alarm({Key? key}) : super(key: key);
  State<StatefulWidget> createState(){
    return alarmState();
  }
}

class alarmState extends State<alarm> {
  AssetsAudioPlayer player = AssetsAudioPlayer();

  static var path = 'assets/sound/lofi.mp3';
  List <alarm_sounds> alarms = alarm_sounds.getAlarmsounds();
  alarm_sounds selected_alarm_sounds  = new alarm_sounds(0,"","");
  int selectedRadio = 0;
  int selectedRadioTile=0;
  @override
  void iniState(){
    super.initState();

  }

  setselected_alarm_sounds(var sounds){
    setState(() {
      selected_alarm_sounds = sounds;
    });
  }

    List<Widget> createRadioListAlarms(){
    List<Widget> widgets = [];
    for(alarm_sounds alarmss in alarms){
      widgets.add(
          RadioListTile(
            value: alarmss,
            groupValue: selected_alarm_sounds,
            title: Text(alarmss.Title),
            subtitle: Text(alarmss.Subtitle),
            onChanged: (currentAlarms){
              path = ('assets/sound/${alarmss.Title}.mp3');
              player.stop();
              setselected_alarm_sounds(currentAlarms);
              //print(path);
              player.open(Audio(path),showNotification: true);
            },
            //selected: alarmss.song_id==2 ? true:false,
            toggleable: false,
            activeColor: Colors.black,
          ),
      );
    }
    return widgets;
  }


  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        key: scaffoldKey,
        //appBar: AppBar(title:
        // Text('Alarm sounds', style: GoogleFonts.quicksand(fontWeight: FontWeight.w600,),),backgroundColor: Colors.black,),
        //backgroundColor: Colors.white, //background color of canvas
          body:
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(20,65,0,5),
                      child:
                      Row(
                        children: [
                        Text('Alarm sounds                                ',
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,textStyle: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: .5),),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.keyboard_return,
                            color: Colors.black,
                            size: 25,
                          ),
                          onPressed: () {
                            player.stop();
                            Navigator.push(context,
                                MaterialPageRoute(builder:(context)=>settingPage()));
                          },
                        ),
                      ],
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      )
                  ),
                  Expanded(
                    flex: 1,
                    child:
                    ListView(
                      padding: EdgeInsets.zero,
                        //shrinkWrap:true,
                        children: [
                        Column(children: createRadioListAlarms(),)
                      ],),
                  )

                ],
              )
    );}

}


class alarm_sounds{

  int song_id = 0;
  String Title = "";
  String Subtitle = "";

  //alarm_sounds({this.song_id});
  alarm_sounds(this.song_id,this.Title,this.Subtitle);

  static List<alarm_sounds> getAlarmsounds(){
    return <alarm_sounds>[
      alarm_sounds(1,"amazing_wake_up_sound","Orchestralis"),
      alarm_sounds(2,"ballad-alarm","Alexander Nakarada"),
      alarm_sounds(3,"enrique_granados-twelve_spanish_dances-oriental","Monica Alianello"),
      alarm_sounds(4,"flying-alarm","Bryan Teoh"),
      alarm_sounds(5,"Alarm 5","Author 5"),
      alarm_sounds(6,"Alarm 6","Author 6"),
      alarm_sounds(7,"Alarm 7","Author 7"),
      alarm_sounds(8,"Alarm 8","Author 8"),
      alarm_sounds(9,"Alarm 9","Author 9"),
      alarm_sounds(10,"Alarm 10","Author 10"),
      alarm_sounds(11,"Alarm 11","Author 11"),
      alarm_sounds(12,"Alarm 12","Author 12"),

    ];
  }
}