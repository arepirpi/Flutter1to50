import 'package:flutter/material.dart';

class highscorePage extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("highscore page"),
        ),
        body: new Checkbox(
            value: false,
            onChanged: null
        )
    );
  }
}