import 'package:flutter/material.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double imageHeight = screenHeight / 2.5;

    return SizedBox(
      height: imageHeight,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _controller,
            children: [
              Image.asset(
                'assets/images/road_canyon.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Image.asset(
                'assets/images/road_canyon.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Image.asset(
                'assets/images/road_canyon.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                  ),
                  height: 8.0,
                  width: 8.0,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? const Color(0xFF5a9faf)
                        : Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
