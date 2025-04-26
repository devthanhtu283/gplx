import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SituationDetailPage extends StatefulWidget {
  final int initialIndex; // Chỉ số tình huống ban đầu
  final List<Map<String, dynamic>> situations; // Danh sách các tình huống

  SituationDetailPage({required this.initialIndex, required this.situations});

  @override
  _SituationDetailPageState createState() => _SituationDetailPageState();
}

class _SituationDetailPageState extends State<SituationDetailPage> {
  late int currentIndex;
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  int? _flaggedSecond; // Store the second where the flag is set
  bool isCheckFlag = false;

  // Scoring and color logic
  final int videoLength = 21;
  final int danger = 12;
  final String fiveScore = "green";
  final String fourScore = "blue";
  final String threeScore = "yellow";
  final String twoScore = "orange";
  final String oneScore = "red";
  final String zeroScore = "black";

  late Map<int, String> colorMap;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _initializeVideoPlayer();
    _initializeColorMap();
  }

  void _initializeVideoPlayer() {
    _controller = VideoPlayerController.network(
      'https://v.vnecdn.net/vnexpress/video/web/mp4/2024/03/25/th001.mp4',
    )..initialize().then((_) {
      setState(() {});
      _controller.setLooping(true);
    });
  }

  void _initializeColorMap() {
    colorMap = {};
    List<String> colors = [oneScore, twoScore, threeScore, fourScore, fiveScore];
    int j = 0;
    for (int i = danger; i > (danger - 5); i--) {
      j++;
      colorMap[i] = colors[j - 1];
    }
    // Fill remaining seconds with black
    for (int i = 0; i < videoLength; i++) {
      if (!colorMap.containsKey(i)) {
        colorMap[i] = zeroScore;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _previousSituation() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        _controller.pause();
        _isPlaying = false;
        _flaggedSecond = null; // Reset flag when changing situation
        _initializeVideoPlayer();
      }
    });
  }

  void _nextSituation() {
    setState(() {
      if (currentIndex < widget.situations.length - 1) {
        currentIndex++;
        _controller.pause();
        _isPlaying = false;
        _flaggedSecond = null; // Reset flag when changing situation
        _initializeVideoPlayer();
      }
    });
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  void _flagCurrentPosition() {
    if (!isCheckFlag) {
      final position = _controller.value.position.inSeconds;
      print('Video stopped at: $position seconds');
      setState(() {
        isCheckFlag = true;
        _flaggedSecond = (position + 1).clamp(0, videoLength + 1); // Store the flagged second
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentSituation = widget.situations[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('${currentIndex + 1}: ${currentSituation['title'].split(':')[0]}...'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Chia sẻ tình huống')),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Mở menu')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Phần video
          _controller.value.isInitialized
              ? Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ],
          )
              : Container(
            height: 200,
            color: Colors.grey[300],
            child: Center(child: CircularProgressIndicator()),
          ),
          // Thanh tiến độ video
          VideoProgressIndicator(
            _controller,
            allowScrubbing: true,
            colors: VideoProgressColors(
              playedColor: Colors.red,
              bufferedColor: Colors.grey,
              backgroundColor: Colors.grey[300]!,
            ),
          ),
          // Thanh điểm số với cờ
          isCheckFlag
              ? ScoreProgressBar(
            videoLength: videoLength,
            colorMap: colorMap,
            controller: _controller,
            flaggedSecond: _flaggedSecond,
          )
              : Text(""),
          // Nút điều khiển video và điều hướng
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.replay),
                onPressed: () {
                  _controller.seekTo(Duration.zero);
                  _controller.play();
                  setState(() {
                    _isPlaying = true;
                    _flaggedSecond = null; // Reset flagged second
                    isCheckFlag = false; // Hide score progress bar
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                onPressed: _togglePlayPause,
              ),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: _flagCurrentPosition,
              ),
            ],
          ),
          // Nút điều hướng qua lại và nút cờ
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: currentIndex > 0 ? _previousSituation : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                ),
                child: Icon(Icons.arrow_left),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: _flagCurrentPosition,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  foregroundColor: Colors.black,
                ),
                child: Icon(Icons.flag),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: currentIndex < widget.situations.length - 1 ? _nextSituation : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                ),
                child: Icon(Icons.arrow_right),
              ),
            ],
          ),
          // Phần mô tả tình huống
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tình huống ${currentIndex + 1}: ${currentSituation['title']}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      currentSituation['description'],
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: Center(
                        child: Text(
                          'Hình ảnh minh họa\n(${currentSituation['image']})',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom widget for score progress bar with flags
class ScoreProgressBar extends StatelessWidget {
  final int videoLength;
  final Map<int, String> colorMap;
  final VideoPlayerController controller;
  final int? flaggedSecond;

  const ScoreProgressBar({
    Key? key,
    required this.videoLength,
    required this.colorMap,
    required this.controller,
    this.flaggedSecond,
  }) : super(key: key);

  Color _getColor(String colorName) {
    switch (colorName) {
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      case 'orange':
        return Colors.orange;
      case 'red':
        return Colors.red;
      case 'black':
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, VideoPlayerValue value, child) {
          final currentSecond = value.position.inSeconds.clamp(0, videoLength - 1);
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              // Progress bar segments
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(videoLength, (index) {
                  return Expanded(
                    child: Container(
                      height: 10,
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      color: _getColor(colorMap[index] ?? 'black'),
                    ),
                  );
                }),
              ),
              // Moving flag icon (current position)
              Positioned(
                left: (currentSecond / videoLength) * (MediaQuery.of(context).size.width - 32) +
                    (MediaQuery.of(context).size.width - 32) / (videoLength * 2) -
                    12, // Center on segment
                top: -20, // Above the bar
                child: Icon(
                  Icons.flag,
                  color: Colors.red,
                  size: 24,
                ),
              ),
              // Fixed flag icon (flagged position)
              if (flaggedSecond != null)
                Positioned(
                  left: (flaggedSecond! / videoLength) * (MediaQuery.of(context).size.width - 32) +
                      (MediaQuery.of(context).size.width - 32) / (videoLength * 2) -
                      12, // Center on flagged segment
                  top: -40, // Above the moving flag to avoid overlap
                  child: Icon(
                    Icons.flag,
                    color: Colors.deepPurple, // Different color to distinguish
                    size: 60,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}