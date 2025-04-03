import 'package:flutter/material.dart';
import 'package:gplx/pages/review/review_test_list.dart';
import 'package:gplx/pages/simulator/simulator_dashboard.dart';
import 'package:gplx/pages/test/test_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // Danh sách các mục trong dashboard
  final List<Map<String, dynamic>> dashboardItems = [
    {
      'title': 'Đề ngẫu nhiên',
      'icon': Icons.shuffle,
      'color': Colors.orange,
    },
    {
      'title': 'Thi theo bộ đề',
      'icon': Icons.list_alt,
      'color': Colors.red,
    },
    {
      'title': 'Các câu bị sai',
      'icon': Icons.person,
      'color': Colors.green,
    },
    {
      'title': 'Ôn tập câu hỏi',
      'icon': Icons.book,
      'color': Colors.teal,
    },
    {
      'title': 'Các biển báo',
      'icon': Icons.traffic,
      'color': Colors.blue,
    },
    {
      'title': 'Meo ghi nhớ',
      'icon': Icons.favorite,
      'color': Colors.purple,
    },
    {
      'title': '60 câu điểm liệt',
      'icon': Icons.shield,
      'color': Colors.brown,
    },
    {
      'title': 'Top 50 câu sai',
      'icon': Icons.bar_chart,
      'color': Colors.blueGrey,
    },
    {
      'title': '120 mô phỏng',
      'icon': Icons.lightbulb,
      'color': Colors.cyan,
    },
    {
      'title': 'Bỏ quảng cáo',
      'icon': Icons.block,
      'color': Colors.pink,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hạng B - GPLX 2025'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Xử lý khi nhấn vào nút cài đặt
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: dashboardItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: dashboardItems[index]['color'],
                    child: InkWell(
                      onTap: () {
                        // Chuyển hướng đến ReviewQuestionsPage khi nhấn "Ôn tập câu hỏi"
                        if (dashboardItems[index]['title'] == 'Ôn tập câu hỏi') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReviewTestListPage(),
                            ),
                          );
                        } else if (dashboardItems[index]['title'] == 'Thi theo bộ đề') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TestListPage(),
                            ),
                          );
                        } else if (dashboardItems[index]['title'] == '120 mô phỏng') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SimulationDashboardPage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Bạn đã nhấn vào: ${dashboardItems[index]['title']}'),
                            ),
                          );
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            dashboardItems[index]['icon'],
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(height: 8),
                          Text(
                            dashboardItems[index]['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 60,
              color: Colors.white,
              child: Center(
                child: Text(
                  'Quảng cáo: Trải nghiệm động xe 7 chỗ - Giảm ngay 120K',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}