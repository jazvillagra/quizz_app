import 'package:flutter/material.dart';

/* Main function of the program
void main() {
  //runs app when booted up
  runApp(MyApp());
}
*/
/* This is a shorthand for functions which only have one and exactly one
expression, so only one line of code in the function,then you can omit the curly
braces and instead add an arrow here, which tells Dart this is a function with
only one expression and this here is the expression, please execute.
The runApp() function builds the main widget and calld build() on it.
*/
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  /*
  @override is just a decorator.
  It's just there to make our code a bit clearer and a bit cleaner. Makes it
  clear that we're deliberately overriding the build method which is provided by
  stateless widget, it exists there, but override it with our own implementation
  and actually stateless widget forces us to override it, we don't have the
  option of not overriding it. Nonetheless, this is basically a common practice
  and a good practice.
  */
  @override
  // The build() method returns the widgets ("widget tree") that should be
  // rendered onto the screen
  Widget build(BuildContext context) {
    // MaterialApp takes named arguments
    return MaterialApp(home: Text('Hello!'));
  }
}
