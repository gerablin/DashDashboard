import 'dart:async';

import 'package:dash_dashboard/home_screen/sections/clock/clock.dart';
import 'package:dash_dashboard/services/gas_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const dashboardCardList = <String>["Benzinpreise","Prospekte","Uhrzeit","Bahn"];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Dashboard"),
      ),
      body:  const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Clock()
        ],
      ),
    );
  }
}

