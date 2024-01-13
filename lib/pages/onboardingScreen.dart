import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final controller = PageController();
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller ,
            children: [
              Container(
                color: Colors.red,
                child: Center(
                  child: Text('Screen 1'),
                ),
              ),
              Container(
                color: Colors.green,
                child: Center(
                  child: Text('Screen 2'),
                ),
              ),
              Container(
                color: Colors.blue,
                child: Center(
                  child: Text('Screen 3'),
                ),
              ),
            ],
          ),
    
          Container(
            alignment: Alignment(0, 0.75),
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              
            ),
          ),
        ],
      ),
    );
  }
}
