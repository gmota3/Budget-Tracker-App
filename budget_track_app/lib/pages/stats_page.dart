import 'package:budget_track_app/theme/color.dart';
import 'package:budget_track_app/widget/chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../json/day_month.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});


  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {

  int activeMonth = 4;

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
                    blurRadius: 3
                  )]),
              child: Padding(
                  padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 25),
                child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status",
                            style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                          ),
                          FaIcon(FontAwesomeIcons.magnifyingGlassArrowRight),
                        ],
                      ),
                      SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:List.generate(months.length, (index){
                          return GestureDetector(
                              onTap: (){
                                setState(() {
                                  activeMonth = index;
                                });
                              },
                              child: Container(
                                width: (size.width-40)/7,
                                child: Column(
                                  children: [
                                    Text(
                                      months[index]['label'],
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: activeMonth == index ? primary :
                                          Colors.transparent,
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(color: activeMonth == index ?
                                          primary :
                                          black.withOpacity(0.1))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 7, bottom: 7, right: 12, left: 12),
                                        child: Text(
                                          months[index]['day'],
                                          style: TextStyle(fontSize: 10, color:
                                          activeMonth == index
                                              ? white
                                              :black),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                          );
                        }))
                    ],
                ),
              )
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.01),
                      spreadRadius: 10,
                      blurRadius: 3
                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Net balance", style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: black.withOpacity(0.3)
                            ),),
                            SizedBox(
                              height: 10,
                            ),
                            Text("R\$2446.90", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                            ),)
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: size.width-20,
                          height: 150,
                          child: LineChartSample1(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Wrap(
              spacing: 20,
              children: List.generate(2, (index){
                return Container(
                  width: (size.width-60)/2,
                  height: 170,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.01),
                          spreadRadius: 10,
                          blurRadius: 3,
                        )
                      ]
                  ),
                );
              })
            )
          ],
        ));
  }
}
