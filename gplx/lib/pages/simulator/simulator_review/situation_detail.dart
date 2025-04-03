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

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    // Placeholder cho video (thay bằng URL hoặc file video thực tế)
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', // URL mẫu
    )..initialize().then((_) {
      setState(() {});
      _controller.setLooping(true);
    });
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
              Text(
                'Điểm đánh giá: 5/5',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black54,
                ),
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
                icon: Icon(Icons.fullscreen),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Mở toàn màn hình')),
                  );
                },
              ),
            ],
          ),
          // Nút điều hướng qua lại
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
                    // Placeholder cho hình ảnh minh họa
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