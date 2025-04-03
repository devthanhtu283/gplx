import 'package:flutter/material.dart';

class ReviewQuestionPage extends StatefulWidget {
  final String categoryTitle; // Tiêu đề của bộ đề

  ReviewQuestionPage({required this.categoryTitle});

  @override
  _ReviewQuestionPageState createState() => _ReviewQuestionPageState();
}

class _ReviewQuestionPageState extends State<ReviewQuestionPage> {
  int currentQuestionIndex = 0; // Chỉ số câu hỏi hiện tại
  int? selectedAnswer; // Đáp án được chọn
  bool showResult = false; // Hiển thị kết quả sau khi kiểm tra

  // Danh sách câu hỏi demo
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Phần của đường bộ được sử dụng cho các phương tiện giao thông qua lại là gì?',
      'answers': [
        'Phần mặt đường và lề đường.',
        'Phần đường xe chạy.',
        'Phần đường xe có giới.',
      ],
      'correctAnswer': 1, // Đáp án đúng là "Phần đường xe chạy."
      'explanation': 'Phần đường xe chạy là phần của đường bộ được sử dụng cho các phương tiện giao thông qua lại.',
    },
    {
      'question': '"Làn đường" là gì?',
      'answers': [
        'Là một phần của phần đường xe chạy được chia theo chiều dọc của đường, sử dụng cho xe chạy.',
        'Là một phần của phần đường xe chạy được chia theo chiều dọc của đường, có bề rộng đủ cho xe chạy an toàn.',
        'Là đường cho xe ở tổ chạy, dừng, đỗ an toàn.',
      ],
      'correctAnswer': 1, // Đáp án đúng là đáp án thứ 2
      'explanation': 'Làn đường có bề rộng đủ cho xe chạy an toàn.',
    },
    {
      'question': 'Người điều khiển phương tiện tham gia giao thông phải giảm tốc độ trong trường hợp nào?',
      'answers': [
        'Khi có biển báo hiệu hạn chế tốc độ.',
        'Khi gặp thời tiết xấu như mưa, sương mù.',
        'Cả hai trường hợp trên.',
      ],
      'correctAnswer': 2, // Đáp án đúng là "Cả hai trường hợp trên."
      'explanation': 'Người điều khiển phương tiện phải giảm tốc độ khi có biển báo hiệu hạn chế tốc độ hoặc khi gặp thời tiết xấu.',
    },
  ];

  void checkAnswer() {
    setState(() {
      showResult = true;
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        selectedAnswer = null;
        showResult = false;
      }
    });
  }

  void previousQuestion() {
    setState(() {
      if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
        selectedAnswer = null;
        showResult = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                currentQuestionIndex = 0;
                selectedAnswer = null;
                showResult = false;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Thanh điều hướng câu hỏi
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                questions.length > 5 ? 5 : questions.length,
                    (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      currentQuestionIndex = index;
                      selectedAnswer = null;
                      showResult = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: currentQuestionIndex == index ? Colors.pink : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Câu ${index + 1}',
                      style: TextStyle(
                        color: currentQuestionIndex == index ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Nội dung câu hỏi
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CÂU HỎI ${currentQuestionIndex + 1}:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    currentQuestion['question'],
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  ...List.generate(
                    currentQuestion['answers'].length,
                        (index) => RadioListTile<int>(
                      title: Text(
                        '${index + 1}. ${currentQuestion['answers'][index]}',
                        style: TextStyle(
                          color: showResult && index == currentQuestion['correctAnswer']
                              ? Colors.green
                              : (showResult && selectedAnswer == index && selectedAnswer != currentQuestion['correctAnswer']
                              ? Colors.red
                              : Colors.black),
                        ),
                      ),
                      value: index,
                      groupValue: selectedAnswer,
                      onChanged: (value) {
                        setState(() {
                          selectedAnswer = value;
                          showResult = false;
                        });
                      },
                    ),
                  ),
                  if (showResult && selectedAnswer != null) ...[
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(8),
                      color: selectedAnswer == currentQuestion['correctAnswer']
                          ? Colors.green[100]
                          : Colors.red[100],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedAnswer == currentQuestion['correctAnswer']
                                ? 'Đáp án đúng!'
                                : 'Đáp án sai!',
                            style: TextStyle(
                              color: selectedAnswer == currentQuestion['correctAnswer']
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Giải thích đáp án:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(currentQuestion['explanation']),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'previous',
            onPressed: previousQuestion,
            child: Icon(Icons.arrow_left),
          ),
          FloatingActionButton(
            heroTag: 'check',
            onPressed: selectedAnswer != null ? checkAnswer : null,
            child: Icon(Icons.check),
            backgroundColor: selectedAnswer != null ? Colors.green : Colors.grey,
          ),
          FloatingActionButton(
            heroTag: 'next',
            onPressed: nextQuestion,
            child: Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
  }
}