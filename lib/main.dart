import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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
    /// This is an object of type list, that contains various items of type map
    /// If you know at the time you're writing the code what the final value
    /// will be and you know that this value will never change, then of course
    /// it will also never change during runtime but the value, the final value
    /// is not logged in when your code executes but already after you wrote it
    const questions = const [
      {
        'questionText': 'What\'s yout favorite color?',
        'answers': ['Black', 'Red', 'Green']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Rabbit', 'Dog', 'Cat', 'Elephant', 'Lion']
      },
      {
        'questionText': 'What\'s yout favorite city?',
        'answers': ['Berlin', 'London', 'Madrid', 'Rome']
      }
    ];

    /// MaterialApp takes named arguments
    /// Scaffold() creates a base page design for the app
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),

        /// This body will contain a column, which holds a list of widgets
        /// You can specify the data type the list will contain
        /// children: <Widget>[]
        /// but since all items are widgets, Dart will automatically recognize
        /// the data type of the items and assign it to the list.
        body: Column(
          children: [
            /// Question is a custom widget created specifically to display the
            /// questions of the app. It's a stateless widget that receives the
            /// question's text as input data
            /// To specify a button's function, onPressed recieves the pointer to
            /// the functions that the button should have
            Question(
              questions[_questionIndex]['questionText'],
            ),

            /// To make the amount of questions & answers dinamic, we can map
            /// the list of maps into a list of widgets
            /// what the three preceeding dots do here is they take a list and
            /// they pull all the values in the list OUT of it and ADD them to
            /// the surrounding list as INDIVIDUAL VALUES, so that we don't add
            /// a list to a list, but the values of a list to the list that
            /// surrounds it
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
