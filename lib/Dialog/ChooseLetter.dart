import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactoe/Game/GamePlayCode.dart';
import 'package:tictactoe/ToastAdapter.dart';
import 'package:tictactoe/screen/GameplayScreen.dart';

class ChooseLetter extends StatefulWidget {
  final String gameType;
  const ChooseLetter({Key? key, required this.gameType}) : super(key: key);

  @override
  _ChooseLetterState createState() => _ChooseLetterState();
}

class _ChooseLetterState extends State<ChooseLetter> {
  String groupValue = "";
  String groupValueToss = "";
  String playerValue = "";
  bool buttonText = true;
  bool botFirst = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.black.withOpacity(0.1),
      title: buttonText
          ? Text(
              "Choose One",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          : Text(
              "Toss For Who Takes First Move",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
      content: Container(
        height: 100,
        width: 100,
        child: buttonText
            ? Row(
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          children: [
                            Radio(
                                activeColor: Colors.red,
                                value: "X",
                                groupValue: groupValue,
                                onChanged: (value) {
                                  setState(() {
                                    groupValue = value.toString();
                                    playerValue = "X";
                                  });
                                }),
                            Text(
                              "  X",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: Row(
                          children: [
                            Radio(
                                activeColor: Colors.red,
                                value: "O",
                                groupValue: groupValue,
                                onChanged: (value) {
                                  setState(() {
                                    groupValue = value.toString();
                                    playerValue = "O";
                                  });
                                }),
                            Text(
                              "  O",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          children: [
                            Radio(
                                activeColor: Colors.red,
                                value: "Head",
                                groupValue: groupValueToss,
                                onChanged: (value) {
                                  setState(() {
                                    groupValueToss = value.toString();
                                  });
                                }),
                            Text(
                              "  Head",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          children: [
                            Radio(
                                activeColor: Colors.red,
                                value: "Tail",
                                groupValue: groupValueToss,
                                onChanged: (value) {
                                  setState(() {
                                    groupValueToss = value.toString();
                                  });
                                }),
                            Text(
                              "  Tail",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
      actions: [
        Container(
          child: Center(
            child: TextButton(
              onPressed: () {
                if(groupValue==''){
                  ToastAdapter().on200("Please Select a Letter");
                  return;
                }
                if(groupValueToss=='' && !buttonText){
                  ToastAdapter().on200("Please Select Head/Tail");
                  return;
                }
                String bot;
                if (groupValue == 'X') {
                  bot = 'O';
                } else {
                  bot = 'X';
                }
                int cho = Random().nextInt(2);
                if ((cho == 0 && groupValueToss == "Head") ||
                    (cho == 1 && groupValueToss == 'Tail')) {
                  setState(() {
                    botFirst = false;
                  });
                }
                if (!buttonText) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GamePlayScreen(
                                gameType: widget.gameType,
                                player: groupValue,
                                bot: bot,
                                botFirst: botFirst,
                              )));
                }
                setState(() {
                  buttonText = false;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  buttonText ? "  Next  " : "   Start  ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
