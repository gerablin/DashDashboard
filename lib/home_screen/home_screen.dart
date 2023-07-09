import 'dart:async';

import 'package:dash_dashboard/home_screen/sections/clock/clock.dart';
import 'package:dash_dashboard/services/gas_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        title: const Text("Dashboard"),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Clock(), GasInformation()],
      ),
    );
  }
}

class GasInformation extends StatefulWidget {
  const GasInformation({super.key});

  @override
  State<GasInformation> createState() => _GasInformationState();
}

class _GasInformationState extends State<GasInformation> {
  var _gasService = GasService();
  var _gasStations = List.empty();
  void onClick() async{

    _gasStations = await _gasService.fetchNearbyGasStations();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Text("GasInformation"), onTap: () => onClick(),);
  }
}
