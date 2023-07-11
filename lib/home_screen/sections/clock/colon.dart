import 'dart:async';

import 'package:flutter/material.dart';

class Colon extends StatefulWidget {
  final Widget? colon;

  const Colon({Key? key, this.colon}) : super(key: key);

  @override
  State<Colon> createState() => _ColonState();
}

class _ColonState extends State<Colon> {
  late Timer timer;
  bool visible = true;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        visible = !visible;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      curve: Curves.fastEaseInToSlowEaseOut,
      opacity: visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: widget.colon ??
          Text(
            ":",
            style: Theme.of(context).textTheme.titleLarge,
          ),
    );
  }
}