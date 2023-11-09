import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF023020),
        appBar: AppBar(
          title: const Text('Dice Roll'),
          backgroundColor: Color(0xFF023020),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1, right = 1;
  String? winCom;

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          const SizedBox(
            height: 140,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        ChangeValue();
                        checkWinningCombination();
                      });
                    },
                    child: Image.asset('images/dice$left.png'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        ChangeValue();
                        checkWinningCombination();
                      });
                    },
                    child: Image.asset('images/dice$right.png'),
                  ),
                ),
              ),
            ],
          ),
          if (winCom != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  winCom!,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                ),
              ),
            ),
        ],
      );
  }

  void ChangeValue() {
    left = 1 + Random().nextInt(6);
    right = 1 + Random().nextInt(6);
  }

  void checkWinningCombination() {
    final total = left + right;
    if (total == 7 || total == 11 || total == 5){
      setState(() {
        winCom = 'Congratulations! You have won with a dice total of $total!';
      });
    }
    else{
      setState(() {
        winCom = null;
      });
    }
  }
}
