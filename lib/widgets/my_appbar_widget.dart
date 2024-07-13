import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabjiwallah/constants/colors.dart';

class MyAppbarWidget extends StatelessWidget {
  const MyAppbarWidget({super.key, required this.title, this.size = 25});
  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipPath(
            clipper: MyBanner(),
            child: Container(
              decoration: const BoxDecoration(
                color: MyColors.fernGreen,
              ),
              height: 150,
              width: double.infinity,
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ptSans(
                      fontSize: size,
                      fontWeight: FontWeight.bold,
                      color: MyColors.timberwolf),
                ),
              ),
            )),
        Container(
          transform: Matrix4.translationValues(
              -MediaQuery.of(context).size.width/2 + 35, -45, 0),
          child: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(CupertinoIcons.back, color: MyColors.antiFlashWhite,)),
        )
      ],
    );
  }
}

class MyBanner extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h - 100);
    path.quadraticBezierTo(w / 2, h + 80, w, h - 100);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
