import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/screen3.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 15),
            () =>
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => ScreenThree()))

    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AttendenceTwo(),
    );
  }
}

class AttendenceTwo extends StatefulWidget {
  const AttendenceTwo({Key? key}) : super(key: key);

  @override
  State<AttendenceTwo> createState() => _AttendenceTwoState();
}

class _AttendenceTwoState extends State<AttendenceTwo> {

  static var countdownDuration = Duration(seconds: 15);
  static var countdownDuration1 = Duration(seconds: 15);
  Duration duration = Duration();
  Duration duration1 = Duration();
  Timer? timer;
  Timer? timer1;
  bool countDown = true;
  bool countDown1 = true;

  @override
  void initState() {
    var hours;
    var mints;
    var secs;
    hours = int.parse("00");
    mints = int.parse("00");
    secs = int.parse("00");
    countdownDuration = Duration(hours: hours, minutes: mints, seconds: secs);
    startTimer();
    reset();
    var hours1;
    var mints1;
    var secs1;
    hours1 = int.parse("10");
    mints1 = int.parse("00");
    secs1 = int.parse("00");
    countdownDuration1 =
        Duration(hours: hours1, minutes: mints1, seconds: secs1);
    startTimer1();
    reset1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black12,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45,
                ),
                Text(
                  "North",
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                    child: buildTime1()),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "West",
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                    child: buildTime2()),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "South",
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                    child: buildTime3()),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "East",
                  style: TextStyle(fontSize: 25),
                ),
                Container(
                    child: buildTime4()),
                SizedBox(
                  height: 48,
                ),
              ]),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      timer!.cancel();
    }
    Navigator.of(context, rootNavigator: true).pop(context);
    return true;
  }

  void reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  void reset1() {
    if (countDown) {
      setState(() => duration1 = countdownDuration1);
    } else {
      setState(() => duration1 = Duration());
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void startTimer1() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime1());
  }

  void addTime() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void addTime1() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration1.inSeconds - addSeconds;
      if (seconds < 0) {
        timer1?.cancel();
      } else {
        duration1 = Duration(seconds: seconds);
      }
    });
  }



  Widget buildTime1() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = twoDigits(duration1.inSeconds.remainder(15));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard1(time: seconds, header: 'SECONDS'),
    ]);
  }

  Widget buildTime2() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = twoDigits(duration1.inSeconds.remainder(15));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard2(time: seconds, header: 'SECONDS'),
    ]);
  }

  Widget buildTime3() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = twoDigits(duration1.inSeconds.remainder(30));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard2(time: seconds, header: 'SECONDS'),
    ]);
  }

  Widget buildTime4() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = twoDigits(duration1.inSeconds.remainder(45));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard2(time: seconds, header: 'SECONDS'),
    ]);
  }


  Widget buildTimeCard1({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(20)),
            child: Text(
              time,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 50),
            ),
          ),
          Text(header, style: TextStyle(color: Colors.black45)),


        ],
      );
}

Widget buildTimeCard2({required String time, required String header}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          child: Text(
            time,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 50),
          ),
        ),
        Text(header, style: TextStyle(color: Colors.black45)),


      ],
    );

