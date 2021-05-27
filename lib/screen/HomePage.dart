import 'package:flutter/material.dart';
import 'package:tictactoe/Dialog/ChooseLetter.dart';
import 'package:tictactoe/screen/About.dart';
import 'package:tictactoe/screen/GameplayScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> willpop()async{
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height < 600
        ? 600
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width < 280
        ? 280
        : MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: willpop,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leadingWidth: 0,
          leading: Container(),
          centerTitle: true,
          title: Text(
            "Tic  Tac  Toe",
            style: TextStyle(color: Colors.white),
          ),
          shadowColor: Colors.black,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: height,
              width: width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("asset/header.png",width: MediaQuery.of(context).size.width,height: 80,),
                    SizedBox(height: MediaQuery.of(context).size.height/10,),
                    TextButton(
                      onPressed: () {
                        showDialog(context: context, builder: (context)=>ChooseLetter(gameType: 'computer',));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text("Play With Computer",style: TextStyle(color: Colors.white,),),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextButton(
                      onPressed: () {
                        showDialog(context: context, builder: (context)=>ChooseLetter(gameType: 'friend',));
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>GamePlayScreen(gameType: 'friend')));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text("Play With Friend",style: TextStyle(color: Colors.white,),),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text("About",style: TextStyle(color: Colors.white,),),
                      ),
                    ),
                    SizedBox(height: 70,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
