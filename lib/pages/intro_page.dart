import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabjiwallah/pages/veggies_page.dart';
import 'package:sabjiwallah/widgets/circular_design_widget.dart';

import '../constants/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/assets/logo.png",
                  color: MyColors.carribeanGreen,
                  width: 200,
                ),
                const SizedBox(
                  height: 50,
                ),
                Ink(
                  width: width - 50,
                  decoration: BoxDecoration(
                      color: MyColors.fernGreen,
                      borderRadius: BorderRadius.circular(8)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const VeggiesPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "Shop!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.bold,
                            color: MyColors.antiFlashWhite,
                            fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
            CircularDesignWidget(
              radius: 300,
              y: -height / 2,
              x: -width / 2,
              color: MyColors.carribeanGreen,
            ),
            CircularDesignWidget(
              radius: 200,
              y: -height / 2,
              x: -width / 2,
              color: MyColors.richBlack,
              opacity: 1,
            ),
            CircularDesignWidget(
              radius: 480,
              y: -height / 2,
              x: width / 2,
              color: MyColors.carribeanGreen,
            ),
            CircularDesignWidget(
              radius: 380,
              y: -height / 2,
              x: width / 2,
              color: MyColors.richBlack,
              opacity: 1,
            ),
            CircularDesignWidget(
              radius: 200,
              y: height / 2,
              x: width / 2,
              color: MyColors.mint,
            ),
            CircularDesignWidget(
              radius: 300,
              y: height / 2,
              x: width / 2,
              color: MyColors.carribeanGreen,
            ),
          ],
        ),
      ),
    );
  }
}
