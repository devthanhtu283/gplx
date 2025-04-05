import 'package:flutter/material.dart';
import 'package:gplx/pages/review/review_question.dart';


class TestListPage extends StatefulWidget {
  @override
  _TestListPageState createState() => _TestListPageState();
}

class _TestListPageState extends State<TestListPage> {
  // Danh sách các bộ đề thi
  final List<Map<String, dynamic>> testItems =
   [
     {
       'title': 'ĐỀ THI SỐ 1',
       'correct': 1, // Số câu đúng (mặc định là 0)
       'wrong': 0, // Số câu sai (mặc định là 0)
     },
     {
       'title': 'ĐỀ THI SỐ 2',
       'correct': 0, // Số câu đúng (mặc định là 0)
       'wrong': 0, // Số câu sai (mặc định là 0)
     },
     {
       'title': 'ĐỀ THI SỐ 3',
       'correct': 0, // Số câu đúng (mặc định là 0)
       'wrong': 0, // Số câu sai (mặc định là 0)
     },
   ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đề thi Hạng B'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Xử lý khi nhấn nút xóa (có thể reset trạng thái các bộ đề)
              setState(() {
                for (var item in testItems) {
                  item['correct'] = 0;
                  item['wrong'] = 0;
                }
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cột
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 1.5, // Tỷ lệ chiều rộng/chiều cao của ô
          ),
          itemCount: testItems.length,
          itemBuilder: (context, index) {
            return Card(
              color: testItems[index]['correct'] > 0 || testItems[index]['wrong'] > 0
                  ? Colors.red[400] // Nếu đã làm, màu đỏ
                  : Colors.grey[300], // Nếu chưa làm, màu xám
              child: InkWell(
                onTap: () {
                  // Chuyển hướng đến ReviewQuestionPage khi nhấn vào bộ đề
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReviewQuestionPage(
                        categoryTitle: testItems[index]['title'],
                        testId: 1,
                      ),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      testItems[index]['title'],
                      style: TextStyle(
                        color: testItems[index]['correct'] > 0 || testItems[index]['wrong'] > 0
                            ? Colors.white
                            : Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (testItems[index]['correct'] > 0 || testItems[index]['wrong'] > 0) ...[
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle, color: Colors.green, size: 20),
                          SizedBox(width: 4),
                          Text(
                            '${testItems[index]['correct']}',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 16),
                          Icon(Icons.cancel, color: Colors.red, size: 20),
                          SizedBox(width: 4),
                          Text(
                            '${testItems[index]['wrong']}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}