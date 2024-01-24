import 'package:flutter/material.dart';

class ScrollableTextBox extends StatelessWidget {
  final String text;

  ScrollableTextBox({required this.text});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
