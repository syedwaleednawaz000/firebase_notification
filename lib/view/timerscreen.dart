import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  Timer? _timer = Timer(const Duration(microseconds: 0), (){});
  int _start = 0;
  List<String> weeklyDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Monday',
  ];
  List<dynamic> percentValue = [];
  void stop(){
    if(_timer != null){
      setState(() {
        // _start = 0;
        _timer!.cancel();
      });
    }
  }
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    // _start = 0;
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        // for(int index = 0 ; index < weeklyDays.length ; index++){
          if (_start >= 60) {
            setState(() {
              timer.cancel();
            });
          } else {
            setState(() {
              percentValue.add(_start);
              _start++;
            });
          }
        // }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var timerValue = _start / 60;
    var timerValueSecond = timerValue * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: const Text(
          "Timer",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                _timer!.isActive ? stop() :startTimer();
              },
              child: _timer!.isActive ? Icon(Icons.stop): Icon(Icons.play_circle_fill)),
          const SizedBox(
            width: 10,
          ),

          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.builder(
                  itemCount: weeklyDays.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {

                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      child: Center(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              child: Row(
                                children: [
                                  Text(weeklyDays[index]),
                                  SizedBox(width: MediaQuery.of(context).size.width*0.013,),
                                  Text(_start.toString()),
                                ],
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*0.013,),
                            CircularPercentIndicator(
                              radius: 20.0,
                              backgroundColor: Colors.grey,
                              progressColor: Colors.blue,
                              lineWidth: 5.0,
                              percent: timerValueSecond,
                              center: Text(
                                _start.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
