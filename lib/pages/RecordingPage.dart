// This page will house the recording functionality of the app. There is a single circular button at the bottom of the
// screen. While the User holds the button down, the app will record audio. When the User releases the button,
// the app will append the text to prior recordings and save the file to disk until the user sends the file to
// the server for processing.

//Services will be handled in a separate file.

// The following is the code for the recording page. It is a stateful widget because it needs to update the UI
// when the user presses the button. The button will change color when the user is recording and when the user
// is not recording. The button will also change color when the user is holding the button down and when the
// user is not holding the button down.

// Code:

import 'package:adjuster_assistant/CustomUI/ScrollableTextBox.dart';
import 'package:flutter/material.dart';
import 'CustomRecordingButton.dart';
import 'package:record/record.dart';

class RecordingPage extends StatefulWidget {
  const RecordingPage({Key? key}) : super(key: key);

  @override
  State<RecordingPage> createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage> {
  bool _isRecording = false;
  bool _isHolding = false;
  final _record = AudioRecorder();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _record.dispose();
  }

  Future<void> ToggleRecording(bool isRecording) async {
    try {
      if (await _record.hasPermission() && !isRecording) {
        await _record.start(const RecordConfig(), path: "test.m4a");
        bool isRecording = await _record.isRecording();
        setState(() {
          _isRecording = isRecording;
        });
      } else {
        await _record.stop();
        bool isRecording = await _record.isRecording();
        setState(() {
          _isRecording = isRecording;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recording Page'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ScrollableTextBox(
              text: _isRecording.toString()), // Display the value of _isHolding
          const SizedBox(height: 200),
          CustomRecordingButton(
            onRecordingStateChange: (isRecording) {
              setState(() {
                _isRecording = isRecording;
                ToggleRecording(_isRecording);
              });
            },
          ),
        ]),
      ),
    );
  }
}
