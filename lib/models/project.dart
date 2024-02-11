import 'package:uuid/uuid.dart';

class Project {
  final String id;
  final String title;
  final String client;
  final DateTime dateCreated;
  final String address;
  List<Transcription> transcriptions;

  Project({
    required this.title,
    required this.client,
    required this.address,
    String? id,
    DateTime? dateCreated,
    List<Transcription>? transcriptions,
  })  : id = id ?? const Uuid().v4(),
        dateCreated = dateCreated ?? DateTime.now(),
        transcriptions = transcriptions ?? [];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'client': client,
      'dateCreated': dateCreated.toIso8601String(),
      'address': address,
    };
  }
}

class Transcription {
  final String id;
  final String text;
  final DateTime timestamp;

  Transcription({
    required this.text,
    String? id,
    DateTime? timestamp,
  })  : id = id ?? const Uuid().v4(),
        timestamp = timestamp ?? DateTime.now();
}
