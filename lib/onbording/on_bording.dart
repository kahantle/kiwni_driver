import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwni_driver/onbording/page1.dart';
import 'package:kiwni_driver/onbording/page2.dart';
import 'package:kiwni_driver/onbording/page3.dart';
import 'package:kiwni_driver/utils/Dimentions.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageViewController = PageController(initialPage: 0);
  int _activePage = 0;
  final List<Widget> _Pages = [const Page1(), const Page2(), const Page3()];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageViewController.dispose(); // dispose the PageController
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Diamentions.screenWidth,
        height: Diamentions.screenHeight,
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: Diamentions.screenWidth,
                    height: Diamentions.screenHeight - 50,
                    child: PageView.builder(
                        controller: _pageViewController,
                        onPageChanged: (int index) {
                          setState(() {
                            _activePage = index;
                          });
                        },
                        itemCount: _Pages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _Pages[index];
                        }),
                  ),
                ],
              ),
            ),
            //creating dots at bottom
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                    _Pages.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: InkWell(
                            onTap: () {
                              _pageViewController.animateToPage(index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black12,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 5,
                                // check if a dot is connected to the current page
                                // if true, give it a different color
                                backgroundColor: _activePage == index
                                    ? Colors.black
                                    : Colors.white30,
                              ),
                            ),
                          ),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
