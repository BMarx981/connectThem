import 'package:flutter/material.dart';
import 'package:connect_four/ui/app.dart';
import 'package:connect_four/ui/tic.dart';
import 'package:connect_four/ui/checkers.dart';
import 'package:connect_four/ui/othello.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/': (context) => Connect(),
        '/tic': (context) => Tic(),
        '/checkers': (context) => Checkers(),
        '/othello': (context) => Othello(),
      },
      initialRoute: '/',
    ),
  );
}
