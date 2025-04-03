import 'package:flutter/material.dart';
import 'package:gplx/pages/simulator/simulator_review/simulator_review_chapter.dart';

class SimulatorReviewListPage extends StatefulWidget {
  @override
  _SimulatorReviewListPageState createState() => _SimulatorReviewListPageState();
}

class _SimulatorReviewListPageState extends State<SimulatorReviewListPage> {
  // Danh sách các chương ôn tập
  final List<Map<String, dynamic>> reviewItems = [
    {
      'chapter': '1',
      'title': 'GIAO THÔNG TRÊN ĐƯỜNG PHỐ',
      'description':
          '29 tình huống thực tế khi tham gia giao thông trong khu đô thị, khu dân cư đông đúc. Ngươi đi bộ sang đường; vượt xe; chuyển làn; lùi xe; đỗ xe; mở cửa xe thiên quan sát;...',
      'progress': '0/29',
    },
    {
      'chapter': '2',
      'title': 'GIAO THÔNG TRÊN ĐƯỜNG NÔNG THÔN',
      'description':
          '14 tình huống thực tế khi tham gia giao thông ở các đường gập khúc vào buổi tối: Người đi bộ; trâu bò kéo xe; gia súc; sử dụng đèn chiếu xa; trời tối;...',
      'progress': '0/14',
    },
    {
      'chapter': '3',
      'title': 'GIAO THÔNG TRÊN ĐƯỜNG CAO TỐC',
      'description':
          '20 tình huống thực tế khi tham gia giao thông ở trên đường cao tốc: Vượt xe; phanh gấp; chuyển làn; nhập làn; lùi trên cao tốc; đi ngược chiều;...',
      'progress': '0/20',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ôn tập theo chương'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: reviewItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(bottom: 16.0),
            child: InkWell(
              onTap: () {
                // Chuyển hướng đến SimulatorChapterDetailPage khi nhấn vào chương
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SimulatorReviewChapterPage(
                      chapterTitle: 'Ôn tập chương ${reviewItems[index]['chapter']}',
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
                        Text(
                          reviewItems[index]['chapter'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            reviewItems[index]['title'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      reviewItems[index]['description'],
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: 0.0,
                            backgroundColor: Colors.grey[300],
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          reviewItems[index]['progress'],
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
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