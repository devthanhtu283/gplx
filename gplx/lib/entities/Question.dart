import 'package:gplx/entities/Answer.dart';
class Question {
  int? id;
  String? content;
  String? image;
  bool? status;
  bool? failed;
  int? correctAnswer;
  List<Answer>? answers;

  Question({
    this.id,
    this.content,
    this.image,
    this.status,
    this.failed,
    this.correctAnswer,
    this.answers,
  });

  // Tạo từ Map (JSON)
  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as int?,
      content: map['content'] as String?,
      image: map['image'] as String?,
      status: map['status'] as bool?,
      failed: map['failed'] as bool?,
      correctAnswer: map['correctAnswer'] as int?,
      answers: (map['answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromMap(e))
          .toList(),
    );
  }

  // Chuyển thành Map (JSON)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'image': image,
      'status': status,
      'failed': failed,
      'correctAnswer': correctAnswer,
      'answers': answers?.map((e) => e.toMap()).toList(),
    };
  }
}
