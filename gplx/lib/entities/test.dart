class Test {
  int? id;
  String? title;
  String? description;
  int? type;
  int? time;
  bool? status;
  int? numberOfQuestion;
  // Constructor
  Test({
    this.id,
    this.title,
    this.description,
    this.type,
    this.time,
    this.status,
    this.numberOfQuestion
  });

  // Phương thức để chuyển đổi từ Map sang đối tượng Dart
  factory Test.fromMap(Map<String, dynamic> map) {
    return Test(
      id: map['id'] as int?,
      title: map['title'] as String?,
      description: map['description'] as String?,
      type: map['type'] as int?,
      time: map['time'] as int?,
      status: map['status'] as bool?,
      numberOfQuestion: map['numberOfQuestion'] as int?,
    );
  }

  // Phương thức để chuyển đổi từ đối tượng Dart sang Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type,
      'time': time,
      'status': status,
      'numberOfQuestion': numberOfQuestion,
    };
  }
}
