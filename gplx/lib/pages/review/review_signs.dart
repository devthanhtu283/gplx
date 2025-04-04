import 'package:flutter/material.dart';

class ReviewSignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6, // Updated to 6 tabs: Prohibition, Warning, Instruction, Direction, Auxiliary, Road Markings
      child: Scaffold(
        appBar: AppBar(
          title: Text('Biển báo đường bộ'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0), // Adjust the height of the TabBar
            child: TabBar(
              isScrollable: true, // Make the TabBar scrollable
              labelColor: Colors.black, // Color of the selected tab text
              unselectedLabelColor: Colors.black87, // Color of unselected tab text
              indicatorColor: Colors.black, // Color of the indicator (underline)
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Style for selected tab
              unselectedLabelStyle: TextStyle(fontSize: 14), // Style for unselected tabs
              tabs: [
                Tab(text: 'Biển báo cấm'),
                Tab(text: 'Biển báo nguy hiểm'),
                Tab(text: 'Biển báo hiệu lệnh'),
                Tab(text: 'Biển báo chỉ dẫn'),
                Tab(text: 'Biển báo phụ'),
                Tab(text: 'Vạch kẻ đường'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Prohibition Signs
            ListView(
              children: [
                SignTile(
                  code: 'P.101',
                  description: 'Đường cấm',
                  imagePath: 'assets/signs/cam/signP101.png',
                ),
                SignTile(
                  code: 'P.102',
                  description: 'Cấm đi ngược chiều',
                  imagePath: 'assets/signs/cam/signP102.png',
                ),
                SignTile(
                  code: 'P.103a',
                  description: 'Cấm ô tô',
                  imagePath: 'assets/signs/cam/signP103a.png',
                ),
                SignTile(
                  code: 'P.103b',
                  description: 'Cấm ô tô rẽ phải',
                  imagePath: 'assets/signs/cam/signP103b.png',
                ),
                SignTile(
                  code: 'P.103c',
                  description: 'Cấm ô tô rẽ trái',
                  imagePath: 'assets/signs/cam/signP103c.png',
                ),
                SignTile(
                  code: 'P.104',
                  description: 'Cấm mô tô',
                  imagePath: 'assets/signs/cam/signP104.png',
                ),
                SignTile(
                  code: 'P.105',
                  description: 'Cấm ô tô và mô tô',
                  imagePath: 'assets/signs/cam/signP105.png',
                ),
                SignTile(
                  code: 'P.106a',
                  description: 'Cấm ô tô tải',
                  imagePath: 'assets/signs/cam/signP106a.png',
                ),
                SignTile(
                  code: 'P.106b',
                  description: 'Cấm ô tô tải theo trọng lượng',
                  imagePath: 'assets/signs/cam/signP106b.png',
                ),
                SignTile(
                  code: 'P.106c',
                  description: 'Cấm ô tô tải chở hàng nguy hiểm',
                  imagePath: 'assets/signs/cam/signP106c.png',
                ),
                SignTile(
                  code: 'P.107',
                  description: 'Cấm ô tô khách và ô tô tải',
                  imagePath: 'assets/signs/cam/signP107.png',
                ),
                SignTile(
                  code: 'P.107a',
                  description: 'Cấm ô tô khách',
                  imagePath: 'assets/signs/cam/signP107a.png',
                ),
                SignTile(
                  code: 'P.107b',
                  description: 'Cấm xe taxi',
                  imagePath: 'assets/signs/cam/signP107b.png',
                ), SignTile(
                  code: 'P.108',
                  description: 'Cấm ô tô kéo rơ moóc',
                  imagePath: 'assets/signs/cam/signP108.png',
                ), SignTile(
                  code: 'P.108a',
                  description: 'Cấm xe sơ-mi rơ-moóc',
                  imagePath: 'assets/signs/cam/signP108a.png',
                ), SignTile(
                  code: 'P.109',
                  description: 'Cấm máy kéo',
                  imagePath: 'assets/signs/cam/signP109.png',
                ), SignTile(
                  code: 'P.110a',
                  description: 'Cấm xe đạp',
                  imagePath: 'assets/signs/cam/signP110a.png',
                ), SignTile(
                  code: 'P.110b',
                  description: 'Cấm xe đạp thồ',
                  imagePath: 'assets/signs/cam/signP110b.png',
                ), SignTile(
                  code: 'P.111a',
                  description: 'Cấm xe gắn máy',
                  imagePath: 'assets/signs/cam/signP111a.png',
                ), SignTile(
                  code: 'P.112',
                  description: 'Cấm người đi bộ',
                  imagePath: 'assets/signs/cam/signP112.png',
                ), SignTile(
                  code: 'P.113',
                  description: 'Cấm xe người kéo, đẩy',
                  imagePath: 'assets/signs/cam/signP113.png',
                ), SignTile(
                  code: 'P.114',
                  description: 'Cấm xe súc vật kéo',
                  imagePath: 'assets/signs/cam/signP114.png',
                ), SignTile(
                  code: 'P.115',
                  description: 'Hạn chế trọng lượng xe',
                  imagePath: 'assets/signs/cam/signP115.png',
                ), SignTile(
                  code: 'P.116',
                  description: 'Hạn chế trọng lượng trên trục xe',
                  imagePath: 'assets/signs/cam/signP116.png',
                ),
                SignTile(
                  code: 'P.117',
                  description: 'Hạn chế chiều cao',
                  imagePath: 'assets/signs/cam/signP117.png',
                ),
                SignTile(
                  code: 'P.118',
                  description: 'Hạn chế chiều ngang',
                  imagePath: 'assets/signs/cam/signP118.png',
                ),
                SignTile(
                  code: 'P.119',
                  description: 'Hạn chế chiều dài ô tô',
                  imagePath: 'assets/signs/cam/signP119.png',
                ),
                SignTile(
                  code: 'P.120',
                  description: 'Hạn chế chiều dài ô tô kéo moóc',
                  imagePath: 'assets/signs/cam/signP120.png',
                ),
                SignTile(
                  code: 'P.121',
                  description: 'Cự ly tối thiểu giữa hai xe',
                  imagePath: 'assets/signs/cam/signP121.png',
                ),
                SignTile(
                  code: 'P.123a',
                  description: 'Cấm rẽ trái',
                  imagePath: 'assets/signs/cam/signP123a.png',
                ),
                SignTile(
                  code: 'P.123b',
                  description: 'Cấm rẽ phải',
                  imagePath: 'assets/signs/cam/signP123b.png',
                ),
                SignTile(
                  code: 'P.124a',
                  description: 'Cấm quay đầu xe',
                  imagePath: 'assets/signs/cam/signP124a.png',
                ),
                SignTile(
                  code: 'P.124b',
                  description: 'Cấm ô tô quay đầu',
                  imagePath: 'assets/signs/cam/signP124b.png',
                ),
                SignTile(
                  code: 'P.124c',
                  description: 'Cấm rẽ trái và quay đầu xe',
                  imagePath: 'assets/signs/cam/signP124c.png',
                ),
                SignTile(
                  code: 'P.124d',
                  description: 'Cấm rẽ phải và quay đầu xe',
                  imagePath: 'assets/signs/cam/signP124d.png',
                ),
                SignTile(
                  code: 'P.124e',
                  description: 'Cấm ô tô rẽ trái và quay xe',
                  imagePath: 'assets/signs/cam/signP124e.png',
                ),
                SignTile(
                  code: 'P.124f',
                  description: 'Cấm ô tô rẽ phải và quay xe',
                  imagePath: 'assets/signs/cam/signP124f.png',
                ),
                SignTile(
                  code: 'P.125',
                  description: 'Cấm vượt',
                  imagePath: 'assets/signs/cam/signP125.png',
                ),
                SignTile(
                  code: 'P.126',
                  description: 'Cấm ôtô tải vượt',
                  imagePath: 'assets/signs/cam/signP126.png',
                ),
                SignTile(
                  code: 'P.127a',
                  description: 'Tốc độ tối đa cho phép về ban đêm',
                  imagePath: 'assets/signs/cam/signP127a.png',
                ),
                SignTile(
                  code: 'P.127b',
                  description: 'Tốc độ tối đa trên từng làn đường',
                  imagePath: 'assets/signs/cam/signP127b.png',
                ),
                SignTile(
                  code: 'P.127c',
                  description: 'Tốc độ tối đa phương tiện trên từng làn đường',
                  imagePath: 'assets/signs/cam/signP127c.png',
                ),
                SignTile(
                  code: 'P.127d',
                  description: 'Biển hết hạn chế tốc độ tối đa',
                  imagePath: 'assets/signs/cam/signP127d.png',
                ),
                SignTile(
                  code: 'P.128',
                  description: 'Cấm bóp còi',
                  imagePath: 'assets/signs/cam/signP128.png',
                ),  SignTile(
                  code: 'P.129',
                  description: 'Kiểm tra',
                  imagePath: 'assets/signs/cam/signP129.png',
                ),  SignTile(
                  code: 'P.130',
                  description: 'Cấm dừng và đỗ xe',
                  imagePath: 'assets/signs/cam/signP130.png',
                ),  SignTile(
                  code: 'P.131a',
                  description: 'Cấm đỗ xe',
                  imagePath: 'assets/signs/cam/signP131a.png',
                ),  SignTile(
                  code: 'P.131b',
                  description: 'Cấm đỗ xe ngày lẻ',
                  imagePath: 'assets/signs/cam/signP131b.png',
                ),  SignTile(
                  code: 'P.131c',
                  description: 'Cấm đỗ xe ngày chẵn',
                  imagePath: 'assets/signs/cam/signP131c.png',
                ),  SignTile(
                  code: 'P.132',
                  description: 'Nhường cho xe ngược chiều qua đường hẹp',
                  imagePath: 'assets/signs/cam/signP132.png',
                ),  SignTile(
                  code: 'DP.133',
                  description: 'Hết cấm vượt',
                  imagePath: 'assets/signs/cam/signDP133.png',
                ),  SignTile(
                  code: 'DP.134',
                  description: 'Hết hạn chế tốc độ tối đa',
                  imagePath: 'assets/signs/cam/signDP134.png',
                ),  SignTile(
                  code: 'DP.135',
                  description: 'Hết tất cả các lệnh cấm',
                  imagePath: 'assets/signs/cam/signDP135.png',
                ),  SignTile(
                  code: 'P.136',
                  description: 'Cấm đi thẳng',
                  imagePath: 'assets/signs/cam/signP136.png',
                ),  SignTile(
                  code: 'P.137',
                  description: 'Cấm rẽ trái và rẽ phải',
                  imagePath: 'assets/signs/cam/signP137.png',
                ),  SignTile(
                  code: 'P.138',
                  description: 'Cấm đi thẳng và rẽ trái',
                  imagePath: 'assets/signs/cam/signP138.png',
                ),  SignTile(
                  code: 'P.139',
                  description: 'Cấm đi thẳng và rẽ phải',
                  imagePath: 'assets/signs/cam/signP139.png',
                ),  SignTile(
                  code: 'P.140',
                  description: 'Cấm xe công nông và các loại xe tương tự',
                  imagePath: 'assets/signs/cam/signP140.png',
                ),  SignTile(
                  code: 'S.508a',
                  description: 'Biển cấm theo giờ',
                  imagePath: 'assets/signs/cam/signS508a.png',
                ),  SignTile(
                  code: 'S.508b',
                  description: 'Biển cấm theo giờ',
                  imagePath: 'assets/signs/cam/signS508b.png',
                )






























              ],
            ),
            // Tab 2: Warning Signs
            ListView(
              children: [
                SignTile(
                  code: 'W.201a',
                  description: 'Chỗ ngoặt nguy hiểm bên trái',
                  imagePath: 'assets/signs/signW201a.png',
                ),
                SignTile(
                  code: 'W.201b',
                  description: 'Chỗ ngoặt nguy hiểm bên phải',
                  imagePath: 'assets/signs/signW201b.png',
                ),
                SignTile(
                  code: 'W.201c',
                  description: 'Chỗ ngoặt nguy hiểm có nguy cơ lật bên phải',
                  imagePath: 'assets/signs/signW201c.png',
                ),
                SignTile(
                  code: 'W.201d',
                  description: 'Chỗ ngoặt nguy hiểm có nguy cơ lật bên trái',
                  imagePath: 'assets/signs/signW201d.png',
                ),
                SignTile(
                  code: 'W.202a',
                  description: 'Nhiều chỗ ngoặt nguy hiểm liên tiếp',
                  imagePath: 'assets/signs/signW202a.png',
                ),
                SignTile(
                  code: 'W.202b',
                  description: 'Nhiều chỗ ngoặt nguy hiểm liên tiếp',
                  imagePath: 'assets/signs/signW202b.png',
                ),
                SignTile(
                  code: 'W.203a',
                  description: 'Đường bị hẹp cả hai bên',
                  imagePath: 'assets/signs/signW203a.png',
                ),
              ],
            ),
            // Tab 3: Instruction Signs
            ListView(
              children: [
                SignTile(
                  code: 'W.201a',
                  description: 'Chỗ ngoặt nguy hiểm bên trái',
                  imagePath: 'assets/signs/signW201a.png',
                ),
                SignTile(
                  code: 'W.201b',
                  description: 'Chỗ ngoặt nguy hiểm bên phải',
                  imagePath: 'assets/signs/signW201b.png',
                ),
                SignTile(
                  code: 'W.201c',
                  description: 'Chỗ ngoặt nguy hiểm có nguy cơ lật bên phải',
                  imagePath: 'assets/signs/signW201c.png',
                ),
                SignTile(
                  code: 'W.201d',
                  description: 'Chỗ ngoặt nguy hiểm có nguy cơ lật bên trái',
                  imagePath: 'assets/signs/signW201d.png',
                ),
                SignTile(
                  code: 'W.202a',
                  description: 'Nhiều chỗ ngoặt nguy hiểm liên tiếp',
                  imagePath: 'assets/signs/signW202a.png',
                ),
                SignTile(
                  code: 'W.202b',
                  description: 'Nhiều chỗ ngoặt nguy hiểm liên tiếp',
                  imagePath: 'assets/signs/signW202b.png',
                ),
                SignTile(
                  code: 'W.203a',
                  description: 'Đường bị hẹp cả hai bên',
                  imagePath: 'assets/signs/signW203a.png',
                ),
              ],
            ),
            // Tab 4: Direction Signs
            ListView(
              children: [
                SignTile(
                  code: 'W.201a',
                  description: 'Chỗ ngoặt nguy hiểm bên trái',
                  imagePath: 'assets/signs/signW201a.png',
                ),
                SignTile(
                  code: 'W.201b',
                  description: 'Chỗ ngoặt nguy hiểm bên phải',
                  imagePath: 'assets/signs/signW201b.png',
                ),
                SignTile(
                  code: 'W.201c',
                  description: 'Chỗ ngoặt nguy hiểm có nguy cơ lật bên phải',
                  imagePath: 'assets/signs/signW201c.png',
                ),
                SignTile(
                  code: 'W.201d',
                  description: 'Chỗ ngoặt nguy hiểm có nguy cơ lật bên trái',
                  imagePath: 'assets/signs/signW201d.png',
                ),
                SignTile(
                  code: 'W.202a',
                  description: 'Nhiều chỗ ngoặt nguy hiểm liên tiếp',
                  imagePath: 'assets/signs/signW202a.png',
                ),
                SignTile(
                  code: 'W.202b',
                  description: 'Nhiều chỗ ngoặt nguy hiểm liên tiếp',
                  imagePath: 'assets/signs/signW202b.png',
                ),
                SignTile(
                  code: 'W.203a',
                  description: 'Đường bị hẹp cả hai bên',
                  imagePath: 'assets/signs/signW203a.png',
                ),
              ],
            ),
            // Tab 5:Extra Signs
            ListView(
              children: [
                SignTile(
                  code: 'W.201a',
                  description: 'Chỗ ngoặt nguy hiểm bên trái',
                  imagePath: 'assets/signs/signW201a.png',
                ),
                SignTile(
                  code: 'W.201b',
                  description: 'Chỗ ngoặt nguy hiểm bên phải',
                  imagePath: 'assets/signs/signW201b.png',
                ),
                SignTile(
                  code: 'W.201c',
                  description: 'Chỗ ngoặt nguy hiểm có nguy cơ lật bên phải',
                  imagePath: 'assets/signs/signW201c.png',
                ),
                SignTile(
                  code: 'W.201d',
                  description: 'Chỗ ngoặt nguy hiểm có nguy cơ lật bên trái',
                  imagePath: 'assets/signs/signW201d.png',
                ),
                SignTile(
                  code: 'W.202a',
                  description: 'Nhiều chỗ ngoặt nguy hiểm liên tiếp',
                  imagePath: 'assets/signs/signW202a.png',
                ),
                SignTile(
                  code: 'W.202b',
                  description: 'Nhiều chỗ ngoặt nguy hiểm liên tiếp',
                  imagePath: 'assets/signs/signW202b.png',
                ),
                SignTile(
                  code: 'W.203a',
                  description: 'Đường bị hẹp cả hai bên',
                  imagePath: 'assets/signs/signW203a.png',
                ),
              ],
            ),
            // Tab 6: Road Line Signs
            ListView(
              children: [
                SignTile(
                  code: 'W.201a',
                  description: 'Chỗ ngoặt nguy hiểm bên trái',
                  imagePath: 'assets/signs/signW201a.png',
                ),
                SignTile(
                  code: 'W.201b',
                  description: 'Chỗ ngoặt nguy hiểm bên phải',
                  imagePath: 'assets/signs/signW201b.png',
                ),
                SignTile(
                  code: 'W.201c',
                  description: 'Chỗ ngoặt nguy hiểm có nguy cơ lật bên phải',
                  imagePath: 'assets/signs/signW201c.png',
                ),
                SignTile(
                  code: 'W.201d',
                  description: 'Chỗ ngoặt nguy hiểm có nguy cơ lật bên trái',
                  imagePath: 'assets/signs/signW201d.png',
                ),
                SignTile(
                  code: 'W.202a',
                  description: 'Nhiều chỗ ngoặt nguy hiểm liên tiếp',
                  imagePath: 'assets/signs/signW202a.png',
                ),
                SignTile(
                  code: 'W.202b',
                  description: 'Nhiều chỗ ngoặt nguy hiểm liên tiếp',
                  imagePath: 'assets/signs/signW202b.png',
                ),
                SignTile(
                  code: 'W.203a',
                  description: 'Đường bị hẹp cả hai bên',
                  imagePath: 'assets/signs/signW203a.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget to display each sign
class SignTile extends StatelessWidget {
  final String code;
  final String description;
  final String imagePath;

  SignTile({
    required this.code,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sign image
          Image.asset(
            imagePath,
            width: 70,
            height: 70,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, color: Colors.red);
            },
          ),
          SizedBox(width: 16),
          // Code and description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  code,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}