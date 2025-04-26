import 'package:gplx/entities/ChapterSimulator.dart';
class ChapterSimulator {
  final int id;
  final String title;
  final String description;
  final bool status;

  ChapterSimulator({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  factory ChapterSimulator.fromMap(Map<String, dynamic> map) {
    return ChapterSimulator(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
    };
  }
}
