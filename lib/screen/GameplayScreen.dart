import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tictactoe/Dialog/ChooseLetter.dart';
import 'package:tictactoe/Dialog/ResultDialog.dart';
import 'package:tictactoe/Game/GamePlayCode.dart';

class GamePlayScreen extends StatefulWidget {
  final String gameType;
  final String bot;
  final String player;
  final bool botFirst;
  const GamePlayScreen({
    Key? key,
    required this.gameType,
    required this.bot,
    required this.player,
    required this.botFirst,
  }) : super(key: key);

  @override
  _GamePlayScreenState createState() => _GamePlayScreenState();
}

class _GamePlayScreenState extends State<GamePlayScreen> {
  late ConfettiController _controllerCenter;
  late ConfettiController _controllerBottomCenter;
  String playerSymbol = "";
  bool tapEnable = true;
  late String move;

  GamePlayCode gamePlayCode = new GamePlayCode();

  final BorderSide _borderSide =
      BorderSide(color: Colors.white, width: 2.0, style: BorderStyle.solid);

  void _handleTap(int index) {
    setState(() {
      gamePlayCode.playerMove(index);
    });
    //if (gamePlayCode.checkDraw()) {
    //}
    if (gamePlayCode.checkforWin()) {
      if (gamePlayCode.checkWhichMarkWon(widget.bot)) {
        print('bot win');
        showDialog(
            context: context,
            builder: (context) => ResultDialog(message: "You Lose"));

        setState(() {
          tapEnable = false;
        });
        return;
      } else {
        if (gamePlayCode.checkWhichMarkWon(widget.player)) {
          print('player win');
          _controllerCenter.play();
          _controllerBottomCenter.play();
          showDialog(
              context: context,
              builder: (context) => ResultDialog(message: "You Win"));
          setState(() {
            tapEnable = false;
          });
          return;
        }
      }
    }
    if(gamePlayCode.checkDraw()){
      showDialog(
          context: context,
          builder: (context) => ResultDialog(message: "Draw !"));
    }
  }

  void _handleTapfriend(int index) {
    setState(() {
      if(move == "Your "){
        gamePlayCode.playerMoveFriends(widget.player, index);
        move ="Your Friend's";
      }else{
        if(move =="Your Friend's"){
          gamePlayCode.playerMoveFriends(widget.bot, index);
          move = "Your ";
        }
      }
    });
    if (gamePlayCode.checkforWin()) {
      if (gamePlayCode.checkWhichMarkWon(widget.bot)) {
        _controllerCenter.play();
        _controllerBottomCenter.play();
        showDialog(
            context: context,
            builder: (context) => ResultDialog(message: "Your Friend Win"));
        setState(() {
          tapEnable = false;
        });
        return;
      } else {
        if (gamePlayCode.checkWhichMarkWon(widget.player)) {
          _controllerCenter.play();
          _controllerBottomCenter.play();
          showDialog(
              context: context,
              builder: (context) => ResultDialog(message: "You Win"));
          setState(() {
            tapEnable = false;
          });
          return;
        }else{
          if(gamePlayCode.checkDraw()){
            showDialog(
                context: context,
                builder: (context) => ResultDialog(message: "Draw !"));
          }
        }
      }
    }
  }

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

  Path drawStar(Size size) {
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    gamePlayCode.initLetter(widget.bot, widget.player);
    if (widget.botFirst) {
      if((widget.gameType == 'computer')) {
        gamePlayCode.insertletter(widget.bot, Random().nextInt(9) + 1);
      }
      setState(() {
        move = "Your Friend's";
      });
    } else {
      setState(() {
        move = "Your ";
      });
    }
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
            (widget.gameType == 'computer')
                ? Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      "You are Playing as " + widget.player,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        Text(
                          "You are Playing as " + widget.player,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Your Friend is Playing as " + widget.bot,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
            (widget.gameType == 'computer')
                ? Container(
                    margin: EdgeInsets.only(bottom: 80),
                    child: Text(
                      widget.botFirst ? "You Lose Toss" : "You Win Toss",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      widget.botFirst ? "Your Friend win Toss" : "You Win Toss",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
            (widget.gameType == 'computer')
                ? Container()
                : Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: Text(
                      move + " Move",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
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
                        (widget.gameType == 'computer')
                            ? _handleTap(index + 1)
                            : _handleTapfriend(index + 1);
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
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: _controllerCenter,
                blastDirectionality: BlastDirectionality
                    .explosive, // don't specify a direction, blast randomly
                shouldLoop:
                    false, // start again as soon as the animation is finished
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple
                ], // manually specify the colors to be used
                createParticlePath: drawStar, // define a custom shape/path.
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ConfettiWidget(
                confettiController: _controllerBottomCenter,
                blastDirection: -pi / 2,
                emissionFrequency: 0.01,
                numberOfParticles: 20,
                maxBlastForce: 100,
                minBlastForce: 80,
                gravity: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
