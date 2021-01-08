import 'package:flutter/material.dart';

void main() {
  //runs app when booted up
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // context is an argument
  Widget build(BuildContext context) {
    // MaterialApp takes named arguments
    return MaterialApp(home: Text('Hello!'));
  }
}
