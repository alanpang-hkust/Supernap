import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'Sleeping.dart';
import 'main.dart';
class mainScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
    appBar: AppBar(title: Text('SuperNap')),
    body: Column( children:[

      //device information
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.96,
              height: 120,
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
                            'images/face.jpg',
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
                                        'Battery: 69&',
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

      Divider(height: 10, color: Colors.transparent,),

      Row(children: [
        Text('Mode',style: TextStyle(fontSize: 30,color: Colors.black)), //time length module
      ]),

      Divider(height: 10, color: Colors.transparent,),

      Row(children: [
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  minimumSize: Size(140,60)
              ),
              child: Column(children: [
                Text('Quick Nap',style: TextStyle(fontSize: 20,color: Colors.white)),
                Row(children: [
                  Icon(Icons.access_alarm , color: Colors.white, size: 15,),
                  Text(' '),
                  Text('5 - 24 minutes',style: TextStyle(fontSize: 15,color: Colors.white))],)
              ],)

          ),
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  minimumSize: Size(140,60)
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
      Divider(height: 10, color: Colors.transparent,),



      Row(children: [
        Text('Sound',style: TextStyle(fontSize: 30,color: Colors.black)), //time length module
      ]),
      Divider(height: 10, color: Colors.transparent,),

      Container(
        height: 80,
        child:
        ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(100,60)
                ),
                child: Column(children: [
                  Icon(Icons.bathroom , color: Colors.white, size: 50,),
                  Text('Rain',style: TextStyle(fontSize: 15,color: Colors.white)),
                ],)
            ),
            ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(100,60)
                ),
                child: Column(children: [
                  Icon(Icons.book , color: Colors.white, size: 50,),
                  Text('Lecture',style: TextStyle(fontSize: 15,color: Colors.white)),
                ],)
            ),
            ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(100,60)
                ),
                child: Column(children: [
                  Icon(Icons.local_cafe , color: Colors.white, size: 50,),
                  Text('Cafe',style: TextStyle(fontSize: 15,color: Colors.white)),
                ],)
            ),
            ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(100,60)
                ),
                child: Column(children: [
                  Icon(Icons.cloud , color: Colors.white, size: 50,),
                  Text('Wind',style: TextStyle(fontSize: 15,color: Colors.white)),
                ],)
            ),
            ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(100,60)
                ),
                child: Column(children: [
                  Icon(Icons.snowing , color: Colors.white, size: 50,),
                  Text('Snow',style: TextStyle(fontSize: 15,color: Colors.white)),
                ],)
            ),
            ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(100,60)
                ),
                child: Column(children: [
                  Icon(Icons.bathroom , color: Colors.white, size: 50,),
                  Text('Rain',style: TextStyle(fontSize: 15,color: Colors.white)),
                ],)
            ),
            ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(100,60)
                ),
                child: Column(children: [
                  Icon(Icons.book , color: Colors.white, size: 50,),
                  Text('Lecture',style: TextStyle(fontSize: 15,color: Colors.white)),
                ],)
            ),
            ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(100,60)
                ),
                child: Column(children: [
                  Icon(Icons.local_cafe , color: Colors.white, size: 50,),
                  Text('Cafe',style: TextStyle(fontSize: 15,color: Colors.white)),
                ],)
            ),


          ],

        ),
      ),
      Divider(height: 10, color: Colors.transparent,),


      Row(children: [
        Text('Duration',style: TextStyle(fontSize: 30,color: Colors.black)), //time length module
      ]),
      Divider(height: 10, color: Colors.transparent,),

      Row(children: [
        ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                minimumSize: Size(80,50)
            ),
            child:
            Text('8 mins',style: TextStyle(fontSize: 15,color: Colors.white)),
        ),
        ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              minimumSize: Size(80,50)
          ),
          child:
          Text('16 mins',style: TextStyle(fontSize: 15,color: Colors.white)),
        ),
        ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              minimumSize: Size(80,50)
          ),
          child:
          Text('24 mins',style: TextStyle(fontSize: 15,color: Colors.white)),
        ),
        ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              minimumSize: Size(80,50)
          ),
          child:
          Text('Custom',style: TextStyle(fontSize: 15,color: Colors.white)),
        ),

      ],),
      Divider(height: 10, color: Colors.transparent,),


      Row(children: [
        Text('Sunrise Alarm',style: TextStyle(fontSize: 30,color: Colors.black)), //sunrise module
        LiteRollingSwitch(
          value: true,
          textOn:"On",
          textOff: "Off",
          colorOn: Colors.greenAccent,
          colorOff: Colors.grey,
          iconOn: Icons.wb_sunny,
          iconOff: Icons.alarm_off,
            textSize: 18
          ,onChanged: (bool position){
            print('clicked');
        },
        ),
      ],),
      Divider(height: 10, color: Colors.transparent,),


      ElevatedButton.icon(
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder:(context)=>Sleeping()));
        },
        icon: Icon(
          Icons.night_shelter_sharp , color: Colors.white, size: 48.0,),
        label: Text('Start Now',style: TextStyle(fontSize: 30,color: Colors.white)),
        style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            minimumSize: Size(280,60)
        ),
      ),


    ])));
  }
}

/*ElevatedButton(
onPressed:(){},
style: ElevatedButton.styleFrom(
primary: Colors.blue,
minimumSize: Size(350,60),
),
child:
Center(
child:
Row(mainAxisSize: MainAxisSize.max, children: [
Icon(Icons.night_shelter_sharp, color: Colors.white, size: 48.0,),
Text('Start Now',style: TextStyle(fontSize: 30,color: Colors.white)),
SizedBox.square(dimension: 4),],
),
),
*/