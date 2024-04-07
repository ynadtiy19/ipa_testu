import 'dart:async';

import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:lottie/lottie.dart';
import 'package:my_first_app/ui/common/app_colors.dart';
import 'package:my_first_app/ui/common/ui_helpers.dart';
import 'package:my_first_app/ui/utils/Config.dart';
import 'package:my_first_app/ui/utils/Utils.dart';
import 'package:my_first_app/ui/views/chat/page/HomePage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late LottieBuilder _splashLottie;
  late AnimationController _lottieController;

  bool _showAppOpenAnimate = true;
  bool _isAnimateFileLoaded = false; // lottie json loaded state

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _lottieInit();
  }

  void _lottieInit() {
    _lottieController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );
    _lottieController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        _lottieController.stop();
        _showAppOpenAnimate = false;
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => HomePage(),
        // ));
      }
    });
    _splashLottie = Lottie.asset(
      'images/splash.json',
      repeat: false,
      animate: true,
      width: double.maxFinite,
      height: double.maxFinite,
      controller: _lottieController,
      onLoaded: (composition) {
        _isAnimateFileLoaded = true;
        _lottieController.forward(from: 0);
        _lottieController.duration = composition.duration;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: renderContent());
  }

  Widget renderContent() {
    if (!_showAppOpenAnimate) {
      return Container();
    }
    return Stack(
      children: [
        Container(
          color: const Color(0xFFF6F1F1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: _splashLottie,
              ),
              if (_isAnimateFileLoaded)
                Text(
                  Config.appName,
                  softWrap: true,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 50,
                    height: 28 / 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (!_isAnimateFileLoaded) const SizedBox(height: 28),
              verticalSpaceSmall,
              CustomButton(
                width: 200,
                backgroundColor: Colors.white,
                shadowColor: kcHotPinkWithTealColor,
                isThreeD: true,
                height: 50,
                borderRadius: 25,
                animate: true,
                margin: const EdgeInsets.all(41),
                iconWidget: const Icon(
                  LineIcons.iceCream,
                  size: 30,
                ),
                onPressed: () {
                  Utils.jumpPage(context, const HomePage()); //重点
                },

                child: Text('Tell Your story'), // 按钮文本
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _lottieController.dispose();

    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }

    super.dispose();
  }
}
