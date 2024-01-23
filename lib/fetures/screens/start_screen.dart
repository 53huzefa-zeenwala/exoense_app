import 'package:expense_app/utils/app_assets.dart';
import 'package:expense_app/utils/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

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
      body: SmallScreenWidget(),
    );
  }
}

class SmallScreenWidget extends StatelessWidget {
  const SmallScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
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
        Expanded(
          child: Column(
            
            children: [
              Text(
                'Spend Smarter\nSave More',
                style: context.textTheme.headlineLarge?.apply(color: context.colorScheme.primary).copyWith(fontSize: 32,),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(onPressed: () {
                
              }, child: Text("Get Started"))
            ],
          ),
        ),
      ],
    );
  }
}
