import 'question.dart';

class TestDetail {
  int? testId;
  int? chapterId;
  Question? question;

  TestDetail({
    this.testId,
    this.chapterId,
    this.question,
  });

  factory TestDetail.fromMap(Map<String, dynamic> map) {
    return TestDetail(
      testId: map['testId'] as int?,
      chapterId: map['chapterId'] as int?,
      question: map['question'] != null ? Question.fromMap(map['question']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'testId': testId,
      'chapterId': chapterId,
      'question': question?.toMap(),
    };
  }
}
