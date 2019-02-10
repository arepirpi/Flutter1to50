import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactoe/custom_dailog.dart';
import 'package:tictactoe/game_button.dart';
import 'package:tictactoe/TimerText.dart';
import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  List<GameButton> buttonsList;
  var player1;
  var player2;
  var activePlayer;

  var currentNum = 1;
  var playerCurrentNum = 1;

  Stopwatch stopwatch = new Stopwatch();

//  var _visible = true;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit() {
    player1 = new List();
    player2 = new List();
    activePlayer = 1;

    var gameButtons = <GameButton>[
      new GameButton(id: 1, visible: true, tapped: false),
      new GameButton(id: 2, visible: true, tapped: false),
      new GameButton(id: 3, visible: true, tapped: false),
      new GameButton(id: 4, visible: true, tapped: false),
      new GameButton(id: 5, visible: true, tapped: false),
      new GameButton(id: 6, visible: true, tapped: false),
      new GameButton(id: 7, visible: true, tapped: false),
      new GameButton(id: 8, visible: true, tapped: false),
      new GameButton(id: 9, visible: true, tapped: false),
      new GameButton(id: 10, visible: true, tapped: false),
      new GameButton(id: 11, visible: true, tapped: false),
      new GameButton(id: 12, visible: true, tapped: false),
      new GameButton(id: 13, visible: true, tapped: false),
      new GameButton(id: 14, visible: true, tapped: false),
      new GameButton(id: 15, visible: true, tapped: false),
      new GameButton(id: 16, visible: true, tapped: false),
      new GameButton(id: 17, visible: true, tapped: false),
      new GameButton(id: 18, visible: true, tapped: false),
      new GameButton(id: 19, visible: true, tapped: false),
      new GameButton(id: 20, visible: true, tapped: false),
      new GameButton(id: 21, visible: true, tapped: false),
      new GameButton(id: 22, visible: true, tapped: false),
      new GameButton(id: 23, visible: true, tapped: false),
      new GameButton(id: 24, visible: true, tapped: false),
      new GameButton(id: 25, visible: true, tapped: false),
    ];
    return gameButtons;
  }

  void playGame(GameButton gb) {
    print("inside play game");

    setState(() {
      print("currentPlayerNum $playerCurrentNum");
      if(playerCurrentNum==int.parse(gb.text)) {
//        gb.text = "";
        playerCurrentNum++;
        gb.visible = false;
        gb.tapped = true;
//        Transform.scale(
//          scale: 0.5,
//          child: gb,
//        );
        if(playerCurrentNum == 50){
          stopwatch.stop();
        }
      }

    });
//    gb.text="";
//    setState(() {
//      gb.text="";
////      if (activePlayer == 1) {
////        gb.text = "X";
////        gb.bg = Colors.red;
////        activePlayer = 2;
////        player1.add(gb.id);
////      } else {
////        gb.text = "0";
////        gb.bg = Colors.black;
////        activePlayer = 1;
////        player2.add(gb.id);
////      }
////      gb.enabled = false;
//
////      int winner = checkWinner();
////      if (winner == -1) {
////        if (buttonsList.every((p) => p.text != "")) {
////          showDialog(
////              context: context,
////              builder: (_) => new CustomDialog("Game Tied",
////                  "Press the reset button to start again.", resetGame));
////        } else {
////          activePlayer == 2 ? autoPlay() : null;
////        }
////      }
//
//    });
  }

  void autoPlay() { //not called now
    var emptyCells = new List();
    var list = new List.generate(9, (i) => i + 1);
    for (var cellID in list) {
      if (!(player1.contains(cellID) || player2.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }

    var r = new Random();
    var randIndex = r.nextInt(emptyCells.length-1);
    var cellID = emptyCells[randIndex];
    int i = buttonsList.indexWhere((p)=> p.id == cellID);
    playGame(buttonsList[i]);

  }

  void showText(GameButton gb) {
    setState(() {
//      if (activePlayer == 1) {
        print("currentNum is $currentNum");
        gb.text = currentNum.toString();
        currentNum++;
        gb.visible = true;
        gb.tapped = false;
//        gb.bg = Colors.red;
//        activePlayer = 2;
//        player1.add(gb.id);
//      }
      gb.enabled = false;
    });
  }

  void showNextNum() { //show next number on random empty cell
    if(currentNum <= 50) {
      var emptyCells = new List();
//    var list = new List.generate(25, (i) => i + 1);
//    for (var cellID in list) {
//      if (!(player1.contains(cellID) || player2.contains(cellID))) {
//        emptyCells.add(cellID);
//      }
//    }
      for (var button in buttonsList) {
//      print(button.text);
        if (button.text == "" || button.visible==false) {
          emptyCells.add(button.id);
        }
      }
      print(emptyCells);
      if (emptyCells.length > 0) {
        var r = new Random();
        var randIndex;
        if (emptyCells.length > 1)
          randIndex = r.nextInt(emptyCells.length - 1);
        else
          randIndex = 0;

        var cellID = emptyCells[randIndex];
        int i = buttonsList.indexWhere((p) => p.id == cellID);
        showText(buttonsList[i]);
      }
    }
  }


  void stopGame(){
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      stopwatch.stop();


//      Firestore.instance.
//      Firestore.instance.collection('test').document()
//          .setData({ 'title': 'KeithTitle', 'author': 'Keithhk' });


      Firestore.instance
          .collection('test')
          .where("author", isEqualTo: "Keithhk")
          .snapshots()
          .listen((data) =>
          data.documents.forEach((doc) => print(doc.data))); //


    });


  }



  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonsList = doInit();
      currentNum=1;
      playerCurrentNum=1;

      stopwatch.start();

      int runcount = 0;
      const oneSec = Duration(milliseconds:200);
      new Timer.periodic(oneSec, (Timer t) {
        if(currentNum>50){
//          print("timer 0 tick");
          t.cancel();
//          const onSec = Duration(milliseconds:1000);
//          new Timer.periodic(onSec, (Timer t) {
//            if(currentNum>=10 && currentNum <=20){
////          print("tick  $t.tick");
//              print("10 timer");
//              showNextNum();
//            }else if(currentNum>20){
//                t.cancel();
//                const _20 = Duration(milliseconds:1000);
//                new Timer.periodic(_20, (Timer t) {
//                  if(currentNum>=20 && currentNum <=30){
//                    print("20 timer");
//                    showNextNum();
//                  }else if(currentNum>30){
//                    t.cancel();
//                    const _30 = Duration(milliseconds:1000);
//                    new Timer.periodic(_30, (Timer t) {
//                      if(currentNum>=30 && currentNum <=40){
//                        print("30 timer");
//                        showNextNum();
//                      }else if(currentNum>40){
//                        t.cancel();
//                        const _40 = Duration(milliseconds:1000);
//                        new Timer.periodic(_40, (Timer t) {
//                          if(currentNum>=40 && currentNum <=49){
//                            print("40 timer");
//                            showNextNum();
//                          }else if(currentNum>49){
//
//                            t.cancel();
//                          }
//                        });
//                      }
//                    });
//                  }
//                });

//            }
//          });

        }else{
          print("0 timer");
          showNextNum();
        }
      });

      print("========================");



//

//

    });
  }

//  const oneSec = const Duration(seconds:1);
//  new Timer.periodic(oneSec, (Timer t) => print('hi!'));

  @override
  Widget build(BuildContext context) {


//
//    final controller = AnimationController(
//      vsync: this,
//      duration: Duration(seconds: 1),
//    );
//
//    final animation = Tween(
//      begin: 0.0,
//      end: 1.0,
//    ).animate(controller);
//
//    FadeTransition(
//        opacity: animation,
//        child: Text(widget.text);
//    )
//
//    controller.forward();
    final AnimationController controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

     final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
     final _sizeTween = Tween<double>(begin: 0.0, end: 300.0);



    return new Scaffold(

        body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new TimerText(
              stopwatch: stopwatch,
            ),

            new Expanded(
              child: new GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 9.0,
                    mainAxisSpacing: 9.0),
                itemCount: buttonsList.length,
                itemBuilder: (context, i) => new SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: new RaisedButton(
                        padding: const EdgeInsets.all(8.0),
                        onPressed: true? () => playGame(buttonsList[i]) : null,
                        child: AnimatedOpacity(
                          opacity: buttonsList[i].visible ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 500),
                          child: new Text(
                              buttonsList[i].text,
                              style: new TextStyle(
                              color: Colors.white, fontSize: 40.0),
                          )
                        ),
                        color: buttonsList[i].bg,
                        disabledColor: buttonsList[i].bg,
                      ),
                    ),
              ),
            ),
            new RaisedButton(
              child: new Text(
                "Next",
                style: new TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.blue,
              padding: const EdgeInsets.all(20.0),
              onPressed: showNextNum,
            ),
            new RaisedButton(
              child: new Text(
                "Reset",
                style: new TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.red,
              padding: const EdgeInsets.all(20.0),
              onPressed: resetGame,
            ), new RaisedButton(
              child: new Text(
                "Stop",
                style: new TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.green,
              padding: const EdgeInsets.all(20.0),
              onPressed: stopGame,
            )

          ],
        ));
  }
}
