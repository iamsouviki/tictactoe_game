import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tictactoe/Dialog/ChooseLetter.dart';
import 'package:tictactoe/Game/GamePlayCode.dart';

class GamePlayScreen extends StatefulWidget {
  final String gameType;
  final String bot;
  final String player;
  const GamePlayScreen({
    Key? key,
    required this.gameType, required this.bot, required this.player,
  }) : super(key: key);

  @override
  _GamePlayScreenState createState() => _GamePlayScreenState();
}

class _GamePlayScreenState extends State<GamePlayScreen> {
  // late String bot;
  // late String player ;
  String playerSymbol = "";
  bool tapEnable = true;

  GamePlayCode gamePlayCode = new GamePlayCode();

  final BorderSide _borderSide =
      BorderSide(color: Colors.white, width: 2.0, style: BorderStyle.solid);

  void _handleTap(int index) {
    setState(() {
      gamePlayCode.playerMove(index);
    });
    if (gamePlayCode.checkDraw()) {
      print('draw');
      setState(() {
        //tapEnable=false;
      });
    }
    if (gamePlayCode.checkforWin()) {
      if (gamePlayCode.checkWhichMarkWon(widget.bot)) {
        print('bot win');
        setState(() {
          tapEnable = false;
        });
      } else {
        if (gamePlayCode.checkWhichMarkWon(widget.player)) {
          print('player win');
          setState(() {
            tapEnable = false;
          });
        }
      }
    }
  }

  /// Returns a border to draw depending on this field index.
  Border _determineBorder(index) {
    Border determinedBorder = Border.all();

    switch (index) {
      case 0:
        determinedBorder = Border(bottom: _borderSide, right: _borderSide);
        break;
      case 1:
        determinedBorder =
            Border(left: _borderSide, bottom: _borderSide, right: _borderSide);
        break;
      case 2:
        determinedBorder = Border(left: _borderSide, bottom: _borderSide);
        break;
      case 3:
        determinedBorder =
            Border(bottom: _borderSide, right: _borderSide, top: _borderSide);
        break;
      case 4:
        determinedBorder = Border(
            left: _borderSide,
            bottom: _borderSide,
            right: _borderSide,
            top: _borderSide);
        break;
      case 5:
        determinedBorder =
            Border(left: _borderSide, bottom: _borderSide, top: _borderSide);
        break;
      case 6:
        determinedBorder = Border(right: _borderSide, top: _borderSide);
        break;
      case 7:
        determinedBorder =
            Border(left: _borderSide, top: _borderSide, right: _borderSide);
        break;
      case 8:
        determinedBorder = Border(left: _borderSide, top: _borderSide);
        break;
    }

    return determinedBorder;
  }

  @override
  void initState() {
    gamePlayCode.initLetter(widget.bot, widget.player);
    gamePlayCode.insertletter(widget.bot, Random().nextInt(9) + 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                "You are Playing as "+widget.player,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: height * 0.6,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: (height * 0.5) / 3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (tapEnable) {
                        _handleTap(index + 1);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(0.0),
                      decoration:
                          BoxDecoration(border: _determineBorder(index)),
                      child: Center(
                          child: Text(
                              gamePlayCode.board[index + 1] == null
                                  ? ""
                                  : gamePlayCode.board[index + 1].toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
