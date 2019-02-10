import 'package:flutter/material.dart';

class realHomePage extends StatelessWidget {
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text("1to50", style: new TextStyle(fontSize:30.0),
                  )
                  )
                ],),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 50.0, right: 50.0, top: 10.0),
                      child: GestureDetector(
                        onTap: () {
//                          Navigator.push(context, MaterialPageRoute(
//                            builder: (context) => LoginPage(),
//                          ));
                        },
                        child: new Container(
                            alignment: Alignment.center,
                            height: 60.0,
                            decoration: new BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: new BorderRadius.circular(9.0)),
                            child: new Text("Play",
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.black))),
                      ),
                    ),
                  )
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 50.0, right: 50.0, top: 10.0),
                      child: GestureDetector(
                        onTap: () {
//                          Navigator.push(context, MaterialPageRoute(
//                            builder: (context) => LoginPage(),
//                          ));
                        },
                        child: new Container(
                            alignment: Alignment.center,
                            height: 60.0,
                            decoration: new BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: new BorderRadius.circular(9.0)),
                            child: new Text("Highscore",
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.black))),
                      ),
                    ),
                  )
                ],
              ),
            ]
          )
        )
    );
  }
}