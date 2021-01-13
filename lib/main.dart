import 'package:flutter/material.dart';

/// This is a shorthand for functions which only have one and exactly one
/// expression, so only one line of code in the function,then you can omit the curly
/// braces and instead add an arrow here, which tells Dart this is a function with
/// only one expression and this here is the expression, please execute.
/// The runApp() function builds the main widget and calld build() on it.
///
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  /// createState is a method that has to return a State object that is connected
  /// to a StatefulWidget.
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

/// This is an object of type State that is connected to a StatefulWidget.
/// State is a generic class, so we have to specify the class to which the state
/// belongs to. In this case, we use a pointer to MyApp.
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    ///Set state is a function that forces Flutter to re-render the user
    /// interface. setState indicates to Flutter that the widget's state is going to change
    /// when the actions performed inside this method take place
    setState(() {
      _questionIndex++;
    });
  }

  /// @override is just a decorator.
  /// It's just there to make our code a bit clearer and a bit cleaner. Makes it
  /// clear that we're deliberately overriding the build method which is provided by
  /// stateless widget, it exists there, but override it with our own implementation
  /// and actually stateless widget forces us to override it, we don't have the
  /// option of not overriding it. Nonetheless, this is basically a common practice
  /// and a good practice.
  /// The build() method returns the widgets ("widget tree") that should be
  /// rendered onto the screen
  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
    ];

    /// MaterialApp takes named arguments
    /// Scaffold() creates a base page design for the app
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),

        /// this body will contain a column, which holds a list of widgets
        body: Column(
          /// You can specify the data type the list will contain
          /// children: <Widget>[]
          /// but since all items are widgets, Dart will automatically recognize
          /// the data type of the items and assign it to the list.
          children: [
            /// To specify a button's function, onPressed recieves the pointer to
            /// the functions that the button should have
            Text(questions[_questionIndex]),
            RaisedButton(
              child: Text('Red'),
              onPressed: _answerQuestion,
            ),

            /// If the function is only going to be executed in a specific place
            /// or a single specific behavior, you can simply create the function
            /// in the onPressed instruction
            RaisedButton(
              child: Text('Green'),
              onPressed: () => print('Answered question: Green'),
            ),

            /// For longer functions, simply replace arrow with curly braces
            /// and write all function instructions inside them
            RaisedButton(
              child: Text('Blue'),
              onPressed: () {
                String chosen = 'Blue';
                print('Answered question: ' + chosen);
              },
            )
          ],
        ),
      ),
    );
  }
}
