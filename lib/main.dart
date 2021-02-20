import 'package:flutter/material.dart';
import 'package:flutter_onboarding_ui/utils/color_code.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Onboarding());
  }
}

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _controller;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: Text(
                "Skip",
                style: TextStyle(color: ColorCode.primary, fontSize: 18),
              ),
            )
          ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              onPageChanged: (page) {
                setState(() {
                  index = page;
                });
              },
              controller: _controller,
              children: [
                MakePage(
                    image: 'assets/images/one.png',
                    title: 'Have a thought',
                    content:
                        'Share your thoughts, say what you feel, let the world know'),
                MakePage(
                    image: 'assets/images/two.png',
                    title: 'Find what others feel',
                    content:
                        'Identify new people around you, get connected to people with same interest'),
                MakePage(
                    image: 'assets/images/three.png',
                    title: 'Get connected',
                    content:
                        'Identify new people around you, get connected to people with same interest')
              ],
            ),
            Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicators(),
                )),
          ],
        ),
      ),
    );
  }

  Widget MakePage({image, title, content, reverse = false}) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(
          children: [
            Container(
              height: 250,
              child: Image.asset(image),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: ColorCode.primary),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: ColorCode.grey_color),
            )
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 30 : 8,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: ColorCode.secondary, borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicators() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (index == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
