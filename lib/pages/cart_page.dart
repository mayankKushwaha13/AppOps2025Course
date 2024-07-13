import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabjiwallah/constants/colors.dart';
import 'package:sabjiwallah/constants/lists.dart';
import 'package:sabjiwallah/models/cart.dart';
import 'package:sabjiwallah/pages/intro_page.dart';
import 'package:sabjiwallah/widgets/my_appbar_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final total = calculateTotal();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      const MyAppbarWidget(
                        title: "Cart",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cart.length,
                          itemBuilder: (context, index) {
                            Cart item = cart[index];
                            return Card(
                              elevation: 2,
                              color: MyColors.pistachio,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Card(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          color: MyColors.stone,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Image.asset(
                                              item.image,
                                              width: 120,
                                            ),
                                          )),
                                      Card(
                                        color: MyColors.darkGreen,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4),
                                          width: 120,
                                          alignment: Alignment.center,
                                          child: Text(
                                            item.name,
                                            style: GoogleFonts.ptSans(
                                                fontSize: 20,
                                                color: MyColors.antiFlashWhite),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "₹ ${item.price.toStringAsFixed(2)}",
                                          style: GoogleFonts.aBeeZee(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: MyColors.darkGreen),
                                        ),
                                        Text(
                                          "Selected Amount (Kg) :",
                                          style: GoogleFonts.ptSans(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: MyColors.richBlack),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              item.amount.round().toString(),
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      Card(
                        elevation: 2,
                        color: MyColors.brunswickGreen,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total : ",
                                style: GoogleFonts.ptSans(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.antiFlashWhite
                                ),
                              ),
                              Text(
                                "₹ $total",
                                style: GoogleFonts.comicNeue(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.antiFlashWhite
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Ink(
                        decoration: BoxDecoration(
                            color: MyColors.mountainMeadow,
                            borderRadius: BorderRadius.circular(8)),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            vegetables.forEach((e)=>e.amount = 1);
                            fruits.forEach((e)=>e.amount = 1);
                            cart.clear();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const IntroPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "Done!",
                              style: GoogleFonts.dmSans(
                                  fontSize: 20,
                                  color: MyColors.richBlack,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
