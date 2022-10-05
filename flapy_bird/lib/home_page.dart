// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:async';

import 'package:flapy_bird/bariyer.dart';
import 'package:flapy_bird/kus.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double kusY = 0;
  double a = 0;
  double b = 0;
  double kusPozisyon = kusY;
  double uzunluk = 0;
  double hiz = 3;
  double yerCekimi = -7;
  double zaman = 0;
  bool oyunBasladiMi = false;
  static double birinci = 1;
  double ikinci = birinci + 2;

  //-gt^2*1/2+vt*1/2
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Game Over"),
          content: Text("ÖLDÜN YETİM"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(child: Text("Oyna"), onPressed: reset),
          ],
        );
      },
    );
  }

  void run() {
    oyunBasladiMi = true;
    Timer.periodic(
      Duration(milliseconds: 50),
      (timer) {
        setState(() {
          uzunluk = (yerCekimi * zaman * zaman) + (hiz * zaman);
          kusY = kusPozisyon - uzunluk;
          zaman += 0.01;
        });
        setState(() {
          if (birinci < -2) {
            birinci += 3;
          } else {
            birinci -= 0.05;
          }
        });
        setState(() {
          if (ikinci < -2) {
            ikinci += 3;
          } else {
            ikinci -= 0.05;
          }
        });
        if (kusOldumu()) {
          timer.cancel();
          oyunBasladiMi = false;
          _showDialog();
        }
      },
    );
  }

  bool kusOldumu() {
    if (birinci < 0.2 && birinci > -0.2) {
      if (kusY < -0.3 || kusY > 0.7) {
        return true;
      }
    }
    if (ikinci < 0.2 && ikinci > -0.2) {
      if (kusY < -0.8 || kusY > 0.4) {
        return true;
      }
    }

    return false;

    /* if (kusY < -1 || kusY > 1) {
      return true;
    } else {
      return false;
    }*/
  }

  void jump() {
    setState(() {
      zaman = 0;
      kusPozisyon = kusY;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: oyunBasladiMi ? jump : run,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Stack(children: [
                      Kus(kusKonum: kusY),
                      AnimatedContainer(
                        alignment: Alignment(birinci, 1.1),
                        duration: Duration(),
                        child: MyBarier(size: 200.0),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(birinci, -1.1),
                        duration: Duration(),
                        child: MyBarier(size: 100.0),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(ikinci, 1.1),
                        duration: Duration(),
                        child: MyBarier(size: 300.0),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(ikinci, -1.1),
                        duration: Duration(),
                        child: MyBarier(size: 150.0),
                      ),
                      Container(
                        alignment: Alignment(0, -0.5),
                        child: oyunBasladiMi
                            ? Text("")
                            : Text(
                                "BAŞLA",
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ]),
                  ),
                )),
            Expanded(
                child: Container(
              color: Colors.brown,
            ))
          ],
        ),
      ),
    );
  }

  void reset() {
    Navigator.pop(context);
    setState(() {
      kusY = 0;
      kusPozisyon = kusY;
      oyunBasladiMi = false;
      zaman = 0;
    });
  }
}
