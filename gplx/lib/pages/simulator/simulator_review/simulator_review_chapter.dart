import 'package:flutter/material.dart';
import 'package:gplx/pages/simulator/simulator_review/situation_detail.dart';

class SimulatorReviewChapterPage extends StatefulWidget {
  final String chapterTitle; // Tiêu đề của chương

  SimulatorReviewChapterPage({required this.chapterTitle});

  @override
  _SimulatorReviewChapterPageState createState() => _SimulatorReviewChapterPageState();
}

class _SimulatorReviewChapterPageState extends State<SimulatorReviewChapterPage> {
  // Danh sách các tình huống mô phỏng
  final List<Map<String, dynamic>> situations = [
    {
      'title': 'Người đi bộ sang đường bị khuất sau xe tải',
      'description':
      'Nhấn SPACE ngay khi phát hiện có người đi bộ sang đường xuất hiện ngay sau đuôi xe tải.',
      'image': 'assets/images/situation1.jpg', // Placeholder cho hình ảnh
      'difficulty': 5, // Độ khó (5 sao)
    },
    {
      'title': 'Người đi bộ vượt đèn đỏ sang đường',
      'description':
      'Nhấn SPACE khi người đi bộ không dừng lại tại đảo phân cách giữa đường mà tiếp tục bước sang đường.',
      'image': 'assets/images/situation2.jpg', // Placeholder cho hình ảnh
      'difficulty': 5, // Độ khó (5 sao)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chapterTitle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: situations.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(bottom: 16.0),
            child: InkWell(
              onTap: () {
                // Chuyển hướng đến SituationDetailPage khi nhấn vào tình huống
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SituationDetailPage(
                      initialIndex: index,
                      situations: situations,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue[100],
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            situations[index]['title'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: List.generate(
                        situations[index]['difficulty'],
                            (i) => Icon(
                          Icons.star,
                          color: Colors.grey,
                          size: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      situations[index]['description'],
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: Center(
                        child: Text(
                          'Hình ảnh minh họa\n(${situations[index]['image']})',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}