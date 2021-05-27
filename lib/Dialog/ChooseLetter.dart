import 'package:flutter/material.dart';
import 'package:tictactoe/Game/GamePlayCode.dart';
import 'package:tictactoe/screen/GameplayScreen.dart';

class ChooseLetter extends StatefulWidget {
  const ChooseLetter({Key? key}) : super(key: key);

  @override
  _ChooseLetterState createState() => _ChooseLetterState();
}

class _ChooseLetterState extends State<ChooseLetter> {
  String groupValue = "";
  String groupValueToss = "";
  String playerValue = "";
  bool buttonText = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.black.withOpacity(0.1),
      title: buttonText
          ?Text(
        "Choose One",
        style: TextStyle(
          color: Colors.white,
        ),
      ):Text(
        "Choose One",
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
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
          ],
        )
        : Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                      "  Tail",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
          ],
        ),
      ),
      actions: [
        Container(
          width: 100,
          child: Center(
            child: TextButton(
              onPressed: () {
                String bot;
                if (groupValue == 'X') {
                  bot = 'O';
                } else {
                  bot = 'X';
                }
                if(!buttonText){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GamePlayScreen(
                            gameType: 'computer',
                            player: groupValue,
                            bot: bot,
                          )));
                }
                setState(() {
                  buttonText=false;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text(
                  buttonText ? "Next" : " Start  ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
              ),
            ),
          ),
        )
      ],
    );
  }
}
