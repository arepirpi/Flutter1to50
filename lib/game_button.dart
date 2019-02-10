import 'package:flutter/material.dart';

class GameButton {
  final id;
  String text;
  Color bg;
  bool enabled;
  bool visible = true;
  bool tapped;

  GameButton(
      {this.id, this.text = "", this.bg = Colors.grey, this.enabled = true, this.visible=true, this.tapped = false});
}
