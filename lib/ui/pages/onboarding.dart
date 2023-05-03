import 'package:earnizik/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'dart:math' as math;

import '../../models/onboard.dart';
import '../components/helper.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);
  static const String routeName = '/onboard';

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController? _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemBuilder: (context, index) {
              return OnboardPageBuilder(index: index);
            },
          ),
          Stack(
            alignment: Alignment.bottomRight,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                bottom: 0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: ContextVariables.height(context) / 3.3,
                      width: ContextVariables.width(context) - 10,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.red, Colors.blue],
                        ),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40.0)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: ContextVariables.height(context) / 3.5,
                        width: ContextVariables.width(context),
                        padding: const EdgeInsets.all(30.0),
                        constraints: BoxConstraints(
                          maxWidth: ContextVariables.width(context),
                        ),
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30.0)),
                          gradient: LinearGradient(
                            colors: [Colors.black87, Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('${_currentPage+1} / 3', style: TextStyle(color: Colors.white54, fontSize: 14),),
                            Text(pages[_currentPage].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30.0,
                                    ),
                                textAlign: TextAlign.center),
                            const SizedBox(height: 10.0),
                            Text(
                              pages[_currentPage].subtitle,
                              style:
                                  Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                              // textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      _controller?.previousPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeInOut);
                                    },
                                    icon: const Icon(Remix.arrow_left_s_line),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                pages[_currentPage].isLastPage
                                    ? ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, HomePage.routeName);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            shape: const StadiumBorder(),
                                            foregroundColor: Colors.black,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15.0,
                                                horizontal: 20.0),),
                                        child: const Text(
                                          'Get Started',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,),
                                        ),
                                      )
                                    : Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            _controller?.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 500),
                                                curve: Curves.easeInOut);
                                          },
                                          icon: const Icon(
                                              Remix.arrow_right_s_line),
                                        ),
                                      ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: ContextVariables.height(context) / 4.1,
                right: 30,
                child: Transform.rotate(
                  angle: 10 * math.pi / 180,
                  child: Icon(
                    pages[_currentPage].icon,
                    size: 80.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardPageBuilder extends StatelessWidget {
  const OnboardPageBuilder({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: ContextVariables.height(context),
      width: ContextVariables.width(context),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(pages[index].image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
