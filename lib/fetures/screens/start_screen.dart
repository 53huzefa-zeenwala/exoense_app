import 'dart:developer';

import 'package:expense_app/core/route/routes.dart';
import 'package:expense_app/utils/app_assets.dart';
import 'package:expense_app/utils/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../core/app/styles.dart';
import '../../utils/screen_breakpoints.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height * 0.9);
    path_0.lineTo(0, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffEEF8F7).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.isMobileAndTabletScreen ? SmallScreenWidget() : LargeScreenWidget(),
    );
  }
}

class SmallScreenWidget extends StatelessWidget {
  const SmallScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // height: context.screenHeight,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomPaint(
                size: Size(
                  context.screenWidth,
                  context.screenHeight * 0.7,
                ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter(),
              ),
              Image.asset(AppAssets.sculptureImage, height: context.screenHeight * 0.65, fit: BoxFit.fitHeight),
            ],
          ),
          Column(
            children: [
              Text(
                'Spend Smarter\nSave More',
                style: context.textTheme.headlineLarge?.apply(color: context.colorScheme.primary).copyWith(
                      fontSize: 32,
                    ),
                textAlign: TextAlign.center,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: linearGradient,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [BoxShadow(color: Color(0xFF3E7C78).withOpacity(0.5), blurRadius: 20, spreadRadius: 0)]),
                margin: EdgeInsets.symmetric(vertical: 15),
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint("hello");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.3),
                    foregroundColor: context.colorScheme.primary,
                  ),
                  child: Text(
                    "Get Started",
                    style: context.textTheme.titleMedium?.apply(color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have account? ", style: context.textTheme.labelLarge),
                  InkWell(
                    onTap: () {
                      print("object");
                      AppRoute.login.pushReplacement(context);
                    },
                    child: Text("Log In", style: context.textTheme.titleMedium?.apply(color: context.colorScheme.primary).copyWith()),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class LargeScreenWidget extends StatelessWidget {
  const LargeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // height: context.screenHeight,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomPaint(
                size: Size(
                  context.screenWidth * 0.5,
                  context.screenHeight,
                ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter(),
              ),
              Image.asset(AppAssets.sculptureImage, height: context.screenHeight * 0.95, width: context.screenWidth * 0.5, fit: BoxFit.fitHeight),
            ],
          ),
          SizedBox(
            width: context.screenWidth * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Spend Smarter\nSave More',
                  style: context.textTheme.headlineLarge?.apply(color: context.colorScheme.primary).copyWith(
                        fontSize: 32,
                      ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: linearGradient,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [BoxShadow(color: Color(0xFF3E7C78).withOpacity(0.5), blurRadius: 20, spreadRadius: 5)]),
                  margin: EdgeInsets.symmetric(vertical: 15),
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint("hello");
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.2), foregroundColor: Colors.white),
                    child: Text("Get Started"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have account? ", style: context.textTheme.labelLarge),
                    InkWell(
                      onTap: () {
                        print("object");
                        AppRoute.login.pushReplacement(context);
                      },
                      child: Text("Log In", style: context.textTheme.labelLarge?.apply(color: context.colorScheme.primary).copyWith()),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
