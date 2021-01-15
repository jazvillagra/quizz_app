import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  /// This property is of type function, which means a whole function returning
  /// a certain data type can be assigned as a property to be used in a widget.
  /// In this example, the selectHandler will receive the _answerQuestion
  /// funtion defined in the main.dart, when instantiating an object of type
  /// Answer(_answerQuestion)
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      /// To specify a button's function, onPressed recieves the pointer to
      /// the functions that the button should have1
      /// If the function is only going to be executed in a specific place
      /// or a single specific behavior, you can simply create the function
      /// in the onPressed instruction
      /// For longer functions, simply replace arrow with curly braces
      /// and write all function instructions inside them
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
