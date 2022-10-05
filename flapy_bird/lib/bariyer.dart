// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyBarier extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final size;

  const MyBarier({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 10, color: Colors.green.shade900)),
    );
  }
}
