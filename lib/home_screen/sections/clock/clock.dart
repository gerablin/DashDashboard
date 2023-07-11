
import 'dart:async';

import 'package:dash_dashboard/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {

  String _currentHour = "";
  String _currentMinute = "";
  String _clockText ="";
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    var _dateTime = DateTime.now();
    _currentHour = _dateTime.hour.toString();
    _currentMinute = _dateTime.minute.toString();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _dateTime = DateTime.now();
      _currentHour = _dateTime.hour < 10? "0${_dateTime.hour.toString()}" :_dateTime.hour.toString();
      _currentMinute = _dateTime.minute< 10? "0${_dateTime.minute.toString()}" :_dateTime.minute.toString();
      _clockText = "$_currentHour:$_currentMinute";
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
    return  Align(
      alignment: Alignment.topRight,
      child: SizedBox(
          child: Text(_clockText,style: Theme.of(context).textTheme.titleLarge,)
      ),
    );
  }
}