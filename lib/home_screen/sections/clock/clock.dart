
import 'dart:async';

import 'package:dash_dashboard/home_screen/sections/clock/colon.dart';
import 'package:dash_dashboard/utils/size_config.dart';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {

  String _currentHour = "";
  String _currentMinute = "";
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    var dateTime = DateTime.now();
    _currentHour = dateTime.hour.toString();
    _currentMinute = dateTime.minute.toString();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      dateTime = DateTime.now();
      _currentHour = dateTime.hour < 10? "0${dateTime.hour.toString()}" :dateTime.hour.toString();
      _currentMinute = dateTime.minute< 10? "0${dateTime.minute.toString()}" :dateTime.minute.toString();
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Spacer(),
          Text(_currentHour,style: Theme.of(context).textTheme.titleLarge,),
          const Colon(),
          Text(_currentMinute,style: Theme.of(context).textTheme.titleLarge,),
        ],
      ),
    );
  }
}