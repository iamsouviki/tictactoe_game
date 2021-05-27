import 'package:flutter/material.dart';
import 'package:tictactoe/screen/HomePage.dart';

class ResultDialog extends StatefulWidget {
  final String message;
  const ResultDialog({Key? key, required this.message}) : super(key: key);

  @override
  _ResultDialogState createState() => _ResultDialogState();
}

class _ResultDialogState extends State<ResultDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.black.withOpacity(0.1),
      content: Container(
        width: 20,
        height: 20,
        child: FittedBox(
            child: Text(
          widget.message,
          style: TextStyle(color: Colors.white, fontSize: 15),
        )),
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "  Back  ",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
