import 'package:flutter/material.dart';

class CustomRecordingButton extends StatefulWidget {
  final Function(bool) onRecordingStateChange;

  CustomRecordingButton({required this.onRecordingStateChange});

  @override
  _CustomRecordingButtonState createState() => _CustomRecordingButtonState();
}

class _CustomRecordingButtonState extends State<CustomRecordingButton> {
  bool _isRecording = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isRecording = true;
          widget.onRecordingStateChange(_isRecording);
        });
      },
      onTapUp: (_) {
        setState(() {
          _isRecording = false;
          widget.onRecordingStateChange(_isRecording);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 75),
        width: _isRecording ? 80.0 : 60.0,
        height: _isRecording ? 80.0 : 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _isRecording ? Colors.red : Colors.blue,
        ),
        child: Icon(
          Icons.mic,
          color: Colors.white,
        ),
      ),
    );
  }
}
