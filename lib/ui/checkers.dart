import 'package:flutter/material.dart';

class Checkers extends StatefulWidget {
  @override
  _CheckersState createState() => _CheckersState();
}

class _CheckersState extends State<Checkers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Center(
                  child: Text(
                    'Select a game to play',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
                title: Text('Connect Them'),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                }),
            ListTile(
                title: Text('Tic Tack Three'),
                onTap: () {
                  Navigator.pushNamed(context, '/tic');
                }),
            ListTile(
                title: Text('Checkout checkers'),
                onTap: () {
                  Navigator.pushNamed(context, '/checkers');
                }),
          ],
        ),
      ),
      appBar: AppBar(
        shape: BeveledRectangleBorder(),
        title: Text("Chick Check"),
      ),
      body: Container(
        child: ,
      ),
    );
  }
}
