import 'package:flutter/foundation.dart';
import '../services/whisper_api.dart';
import '../models/project.dart';

class AudioProvider with ChangeNotifier {
  bool _isRecording = false;
  Transcription? _currentTranscription;

  bool get isRecording => _isRecording;
  Transcription? get currentTranscription => _currentTranscription;

  void startRecording() {
    _isRecording = true;
    notifyListeners();
  }

  void stopRecording() {
    _isRecording = false;
    notifyListeners();
  }

  // Future<void> transcribeAudio(Project project) async {
  //   Transcription result = await WhisperAPI.transcribe();
  //   project.transcriptions.add(result);
  //   _currentTranscription = null;
  //   notifyListeners();
  // }
}
