import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber, rightDiceNumber;
  int count = 0;
  String dice1, dice2;

  random() {
    if (count == 0) {
      leftDiceNumber = 1;
      rightDiceNumber = 1;
      dice1 = "images/dice$leftDiceNumber.png";
      dice2 = "images/dice$rightDiceNumber.png";
    } else {
      var rng = new Random();
      leftDiceNumber = rng.nextInt(6) + 1;
      rightDiceNumber = rng.nextInt(6) + 1;
    }
    count++;
  }

  changeDiceState() {
    setState(() {
      dice1 = "images/dice$leftDiceNumber.png";
      dice2 = "images/dice$rightDiceNumber.png";
    });
  }

  Widget build(BuildContext context) {
    random();
    return Center(
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              onPressed: () {
                random();
                changeDiceState();
              },
              child: Image.asset(dice1),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                random();
                changeDiceState();
              },
              child: Image.asset(dice2),
            ),
          ),
        ],
      ),
    );
  }
}
