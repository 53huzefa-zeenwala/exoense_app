import 'package:expense_app/utils/build_context_ext.dart';
import 'package:flutter/material.dart';

class ProfileFormScreen extends StatelessWidget {
  const ProfileFormScreen({super.key});

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
    return Column(
      children: [
        CustomPaint(
          size: Size(context.screenWidth, (context.screenWidth*0.33602150537634407).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: RPSCustomPainter(),
        )
      ],
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*-0.01075269,0);
    path_0.lineTo(size.width*1.010753,0);
    path_0.lineTo(size.width*1.010753,size.height*0.9120520);
    path_0.cubicTo(size.width*1.010753,size.height*0.9120520,size.width*0.8923172,size.height,size.width*0.5000000,size.height);
    path_0.cubicTo(size.width*0.1076827,size.height,size.width*-0.01075269,size.height*0.9120520,size.width*-0.01075269,size.height*0.9120520);
    path_0.lineTo(size.width*-0.01075269,0);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(Offset(size.width*-3.666035,size.height*-5.948160), Offset(size.width*0.1390242,size.height*1.751744), [Color(0xff429690).withOpacity(1),Color(0xff2A7C76).withOpacity(1)], [0,1]);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}