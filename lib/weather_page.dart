import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool isNotificationEnabled=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
            Color(0xFF08244F),
            Color(0xFF134CB5),
            Color(0xFF0B42AB),
          ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0,0.47,1.0])
        ),
        child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                    // FIRST ROW
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          // NOTIFICATION,LOCATION,
                          child: Row(
                            children: [
                                      SvgPicture.asset(
                                        "assets/assets/icons/location.svg",
                                        semanticsLabel: 'Dart Logo',
                                        height: 27.0,
                                        width: 27.0,
                                      ),
                              SizedBox(width: 5.0,),
                              Text("Fitrolzo",style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: "Blinker",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,),),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          isNotificationEnabled?"assets/assets/icons/notification_fill.svg":"assets/assets/icons/notification_clear.svg",
                          semanticsLabel: 'Dart Logo',
                          height: 27.0,
                          width: 27.0,
                        ),

                      ],
                    ),
                  ),
                  // CLOUD STATUS
                  Icon(FontAwesomeIcons.cloudSunRain,
                    color: Colors.white,size:130 ,),
                SizedBox(height: 20.0,),
                //   TEMPERATURE
                  Text("28°",style: TextStyle(
                    fontSize: 64,
                    fontFamily: 'Blinker',
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),),
                  Text("Precipitations",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Blinker',
                    color: Colors.white,
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Max.:31°",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Blinker',
                        color: Colors.white,
                      ),),
                    SizedBox(width: 10.0,),
                    Text("Min.:25°",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Blinker',
                        color: Colors.white,
                      ),)
                  ],),
                //   TODAY TEMPERATURE
                  Container(
                    margin: EdgeInsets.only(left: 30.0,right:30.0,top:30.0,bottom: 10.0),
                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0),
                    color: Color(0xFF001026).withValues(alpha: 0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      //   FIRST ROW OF RAIN
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/assets/icons/rain.svg",
                              semanticsLabel: 'Dart Logo',
                              height: 27.0,
                              width: 27.0,
                            ),
                            Text("6",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Blinker',
                              color: Colors.white,)),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/assets/icons/noun-humidity.svg",
                              semanticsLabel: 'Dart Logo',
                              height: 27.0,
                              width: 27.0,
                            ),
                            Text("90%",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Blinker',
                              color: Colors.white,)),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/assets/icons/wind.svg",
                              semanticsLabel: 'Dart Logo',
                              height: 27.0,
                              width: 27.0,
                            ),
                            Text("19km/hr",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Blinker',
                              color: Colors.white,)),
                          ],
                        ),

                      //   SECOND ROW OF WIND
                      ],
                    ),
                  ),
                  Container(
                  width: 343,
                    height: 217,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0),
                      color: Color(0xFF001026).withValues(alpha: 0.4),),
                    child:Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Today",style: TextStyle(
                                  fontSize: 22.0,
                                  fontFamily: 'Blinker',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Mar,9",style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            // Column 1
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                               children: [
                                 Text("29°C",style: TextStyle(
                                     fontSize: 18.0,
                                     fontWeight: FontWeight.w400,
                                     color: Colors.white),),
                                 SizedBox(height: 28.0,),
                                 Icon(FontAwesomeIcons.cloudSun,
                                   color: Colors.white,size:35 ,),
                                 SizedBox(height: 30.0,),
                                 Text("15.00",style: TextStyle(
                                     fontSize: 18.0,
                                     fontWeight: FontWeight.w400,
                                     color: Colors.white),),
                               ],
                             ),
                           ),
                            SizedBox(width: 28.0,),
                          //   Column 2
                            Column(
                              children: [
                                Text("26°C",style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),),
                                SizedBox(height: 28.0,),
                                Icon(FontAwesomeIcons.cloudRain,
                                  color: Colors.white,size:35 ,),
                                SizedBox(height: 28.0,),
                                Text("16.00",style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),),
                              ],
                            ),
                            SizedBox(width: 28.0,),
                            //   Column 3
                            Container(
                              width: 80,
                              height: 155,
                              padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 11.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent,width: 1.0),
                                borderRadius: BorderRadius.circular(18),
                                color: Color(0xFF001026).withValues(alpha: 0.2),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("24°C",style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),),
                                  Icon(FontAwesomeIcons.cloud,
                                    color: Colors.white,size:30 ,),
                                  Text("17.00",style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),),
                                ],
                              ),
                            ),
                            SizedBox(width: 28.0,),
                            //   Column 4
                            Column(
                             children: [
                                Text("23°C",style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),),
                               SizedBox(height: 28.0,),
                                Icon(FontAwesomeIcons.cloudMoon,
                                  color: Colors.white,size:30 ,),
                                SizedBox(height: 28.0,),
                                Text("18.00",style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),),
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ),
                 SizedBox(height: 10.0,),
                 Container(
                        width: 343,
                        height: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0),
              color: Color(0xFF001026).withValues(alpha: 0.4),),
                   child: Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Text("Next Forecast",style: TextStyle(
                               fontSize: 26.0,
                               fontWeight: FontWeight.w600,
                               fontFamily: 'Blinker',
                           color: Colors.white),),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Icon(Icons.calendar_month_rounded,color: Colors.white,),
                         ),
          ]
                         ),
                           Row(
                             children: [
                               Column(
                                 children: [
                                 // Column 1
                                   Text("Monday",style: TextStyle(fontSize: 18,
                                       fontWeight: FontWeight.w700,
                                       fontFamily:'AlegreyaSans-Bold',
                                   color: Colors.white),),
                                   SizedBox(height: 15.0,),
                                   Text("Tuesday",style: TextStyle(fontSize: 18,
                                       fontWeight: FontWeight.w700,
                                       fontFamily:'AlegreyaSans-Bold',
                                       color: Colors.white),),
                                   SizedBox(height: 15.0,),
                                   Text("Wednesday",style: TextStyle(fontSize: 18,
                                       fontWeight: FontWeight.w700,
                                       fontFamily:'AlegreyaSans-Bold',
                                       color: Colors.white),),
                                 ],
                               ),
                               SizedBox(width: 75.0,),
                             //   SECOND COLUMN
                               Column(
                                 children: [
                                   Icon(FontAwesomeIcons.droplet,
                                     color: Colors.blue,size:20 ,),
                                   SizedBox(height: 25.0,),
                                   Icon(FontAwesomeIcons.cloudBolt,
                                     color: Colors.white,size:20 ,),
                                   SizedBox(height: 16.0,),
                                   Icon(FontAwesomeIcons.droplet,
                                     color: Colors.white,size:20 ,),
                                 ],
                               ),
                               SizedBox(width: 75.0,),
                             //  THIRD COLUMN
                               Column(
                                 children: [
                                   Text("13°C",style: TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.w700,
                                   color:Colors.white),),
                                   SizedBox(height: 15.0,),
                                   Text("17°C",style: TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.w700,
                                       color:Colors.white),),
                                   SizedBox(height: 15.0,),
                                   Text("15°C",style: TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.w700,
                                       color:Colors.white),),
                                 ],
                               ),
                               SizedBox(width: 5.0,),
                             //   FOURTH COLUMN
                               Column(
                                 children: [
                                   Text("17°C",style: TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.w700,
                                       color:Colors.white.withValues(alpha: 0.5)),),
                                   SizedBox(height: 15.0,),
                                   Text("17°C",style: TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.w700,
                                       color:Colors.white.withValues(alpha: 0.5)),),
                                   SizedBox(height: 15.0,),
                                   Text("17°C",style: TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.w700,
                                       color:Colors.white.withValues(alpha: 0.5)),),
                                 ],
                               )
                             ],
    )

                     ],
                   ),
                 )
                ],
              ),
            ),
          ),
        ),
      );
  }
}
