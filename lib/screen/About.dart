import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height < 600
        ? 600
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width < 280
        ? 280
        : MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.black,
        title: Text(
          "About",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Text(
                  "     'Tic Tac Toe' is implement using BackTracking MiniMax algorithm. Here We have two option : play with computer and play with friend.",
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Text(
                        "Credit : ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text("Souvik Ghosh",style: TextStyle(color: Colors.white),),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    FittedBox(child: Text("Software Developer & \nFinal Year CSE student",style: TextStyle(color: Colors.white),)),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text("Email id : ",style: TextStyle(color: Colors.white),),
                    GestureDetector(onTap:(){launch("mailto:souvikghosh687@gmail.com");},child: Text("souvikghosh687@gmail.com",style: TextStyle(color: Colors.blueAccent),)),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text("Portfolio : ",style: TextStyle(color: Colors.white),),
                    GestureDetector(onTap:(){launch("https://souvikportfolio.web.app/");},child: Text("souvikportfolio.web.app",style: TextStyle(color: Colors.blueAccent),)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
