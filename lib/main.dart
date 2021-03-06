import 'package:flutter/material.dart';
import 'package:connect_four/ui/app.dart';
import 'package:connect_four/ui/tic.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/': (context) => App(),
        '/tic': (context) => Tic(),
      },
      initialRoute: '/',
    ),
  );
}
