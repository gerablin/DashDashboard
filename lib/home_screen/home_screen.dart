import 'package:dash_dashboard/home_screen/sections/clock/clock.dart';
import 'package:dash_dashboard/home_screen/sections/notion/shopping_list.dart';
import 'package:flutter/material.dart';
import 'sections/gas/gas_information.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShoppingList(),
                Clock(),
              ],
            ),
            GasInformation(),
          ],
        ),
      ),
    );
  }
}
