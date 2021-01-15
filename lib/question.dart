import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  /// It's a good convention to put final in front of the properties definition
  /// to tell Dart that the values will never change after its initialization in
  /// the constructor
  final String questionText;

  Question(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      /// An immutable set of offsets in each of the four cardinal directions.
      /// Typically used for an offset from each of the four sides of a box.
      /// For example, the padding inside a box can be represented using this
      /// class. The EdgeInsets class specifies offsets in terms of visual
      /// edges: left, top, right, and bottom.
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(color: Colors.grey[600], fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
