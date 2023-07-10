import 'dart:async';

import 'package:dash_dashboard/home_screen/sections/clock/clock.dart';
import 'package:dash_dashboard/services/gas_service.dart';
import 'package:dash_dashboard/utils/mocks/MockGasStations.dart';
import 'package:flutter/material.dart';

import 'sections/gas/gas_information_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Dashboard"),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Clock(), GasInformation()],
      ),
    );
  }
}
