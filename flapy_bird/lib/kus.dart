// ignore_for_file: avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';

class Kus extends StatefulWidget {
  final double kusKonum;
  const Kus({required this.kusKonum, super.key});

  @override
  State<Kus> createState() => _KusState();
}

class _KusState extends State<Kus> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment(0, widget.kusKonum),
        child: Image.asset(
          "assets/indir.jfif",
          width: 50,
        ));
  }
}
