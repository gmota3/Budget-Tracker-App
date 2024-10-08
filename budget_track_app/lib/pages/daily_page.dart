import 'package:budget_track_app/json/daily_json.dart';
import 'package:budget_track_app/json/day_month.dart';
import 'package:budget_track_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DailyPage extends StatefulWidget {

  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  int activeDay = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody(){
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3)
              ]),
            child:Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 25, right: 20, left: 20),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Transações", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:black
                      ),),
                      FaIcon(FontAwesomeIcons.magnifyingGlass)
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:List.generate(days.length, (index){
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            activeDay = index;
                          });
                        },
                        child: Container(
                        width: (size.width-40)/7,
                        child: Column(
                          children: [
                            Text(
                              days[index]['label'],
                              style: const TextStyle(fontSize: 10),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: activeDay == index ? primary :
                                  Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: activeDay == index ?
                                      primary :
                                      black.withOpacity(0.1))),
                              child: Center(
                                child: Text(
                                  days[index]['day'],
                                  style: TextStyle(fontSize: 10, color:
                                  activeDay == index
                                      ? white
                                      :black),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                      );
                    }),
                  )
                ],
              )
            ) ,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: List.generate(daily.length,(index){
                return Column(
                children: [
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (size.width-40)*0.7,
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: grey.withOpacity(0.1),
                                shape: BoxShape.circle),
                            child: Center(
                              child: Image.asset(
                                  daily[index]['icon'],
                                  width: 30,
                                  height: 30),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Container(
                            width: (size.width-90)*0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  daily[index]['name'],
                                  style: const TextStyle(
                                      fontSize:15,
                                      color: black,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 5,),
                                Text(
                                  daily[index]['date'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: black.withOpacity(0.5),
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: (size.width - 40) * 0.3,
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text( daily[index]['price'],
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: green
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Padding(
                padding: EdgeInsets.only(left: 65, top: 8),
                child: Divider(thickness: 0.8,),
                )
                ],
                );
              })
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: Text("Total", style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: black.withOpacity(0.4)),
                  ),
                ),
                const Spacer(),
                const Text("R\$1780.00", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
