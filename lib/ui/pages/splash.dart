import 'dart:async';
import 'package:earnizik/ui/components/helper.dart';
import 'package:earnizik/ui/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:remixicon/remixicon.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushNamed(context, OnBoardingPage.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: ContextVariables.height(context),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePath.splashbg),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black54,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Remix.customer_service_2_line,
                size: 80.0,
                color: Colors.white,
              ),
              Text(
                'My Music',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Positioned(
            bottom: 10.0,
            child: LoadingAnimationWidget.staggeredDotsWave(color: Colors.white, size: 50,),
          )
        ],
      ),
    );
  }
}
