import 'package:flutter/material.dart';

class Slider extends StatelessWidget {
  const Slider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Slider(),
            ],
          ),
        ),
      ),
    );
  }
}

class Slide extends StatefulWidget {
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slide> {
  int _currentIndex = 0;
  List<String> _imageList = [
    'assets/jpg/image1.jpg',
    'assets/jpg/image2.jpg',
    'assets/jpg/image3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imageList.length;
      });
      startTimer();
    });
  }

  Widget buildIndicator(int index) {
    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? Colors.white : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double sliderWidth = deviceWidth - 40; // Subtracting left and right padding
    double sliderHeight = 200;

    return Container(
      width: sliderWidth,
      height: sliderHeight,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.topCenter, // Set alignment to top center
        children: [
          Positioned.fill(
            child: Image.asset(
              _imageList[_currentIndex],
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _imageList.length,
                (index) => buildIndicator(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
