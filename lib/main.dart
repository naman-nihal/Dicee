import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(
            child: Text('Dicee'),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}
// if all the widgets will reamin same then use stateless widget | If widgets is supposed to change -- Stateful

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void changeDiceface(){
    leftDiceNumber = Random().nextInt(6) + 1; // generates 0 to 5 so added 1
    rightDiceNumber = Random().nextInt(6) + 1;
  }
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Expanded(
              // read documentation
              flex: 1, // ratio in which this expanded will take screen
              child: TextButton(
                onPressed: (){
                  setState(() { // is required to update state
                    changeDiceface();
                  });
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
            Expanded(
              // read documentation
              child: TextButton(
                onPressed: (){
                  setState(() {
                    changeDiceface();
                  });
                },
                child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

