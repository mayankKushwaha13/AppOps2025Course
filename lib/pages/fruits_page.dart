import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabjiwallah/constants/lists.dart';
import 'package:sabjiwallah/models/fruits.dart';
import 'package:sabjiwallah/pages/cart_page.dart';

import '../constants/colors.dart';
import '../models/cart.dart';
import '../widgets/circular_design_widget.dart';
import '../widgets/my_appbar_widget.dart';

class FruitsPage extends StatefulWidget {
  const FruitsPage({super.key});

  @override
  State<FruitsPage> createState() => _FruitsPageState();
}

class _FruitsPageState extends State<FruitsPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircularDesignWidget(
                  radius: 200,
                  x: -width / 2,
                  y: -height / 2,
                ),
                CircularDesignWidget(
                  radius: 150,
                  x: -width / 2,
                  y: -height / 2,
                  color: MyColors.richBlack,
                  opacity: 1,
                ),
                CircularDesignWidget(
                  radius: 200,
                  x: width / 2,
                  y: -height / 2 + 100,
                ),
                CircularDesignWidget(
                  radius: 150,
                  x: width / 2,
                  y: -height / 2 + 100,
                  color: MyColors.richBlack,
                  opacity: 1,
                ),
                CircularDesignWidget(
                  radius: 200,
                  x: width / 2,
                  y: height / 2 + 100,
                ),
                CircularDesignWidget(
                  radius: 150,
                  x: width / 2,
                  y: height / 2 + 100,
                  color: MyColors.richBlack,
                  opacity: 1,
                ),
                Column(
                  children: [
                    const MyAppbarWidget(title: "Choose Fruits"),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: fruits.length,
                        itemBuilder: (context, index) {
                          Fruits fruit = fruits[index];
                          return Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 7),
                              elevation: 2,
                              color: MyColors.stone,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Card(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          color: MyColors.pistachio,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Image.asset(
                                              fruit.image,
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
                                            fruit.name,
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
                                          "₹ ${fruit.price.toString()}",
                                          style: GoogleFonts.aBeeZee(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: MyColors.darkGreen),
                                        ),
                                        Text(
                                          "Select Amount in Kg : ",
                                          style: GoogleFonts.ptSans(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: MyColors.richBlack),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    fruit.amount--;
                                                  });
                                                },
                                                icon: const Icon(
                                                  CupertinoIcons.back,
                                                  color:
                                                      MyColors.antiFlashWhite,
                                                )),
                                            Text(
                                              fruit.amount.round().toString(),
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    fruit.amount++;
                                                  });
                                                },
                                                icon: const Icon(
                                                  CupertinoIcons.forward,
                                                  color:
                                                      MyColors.antiFlashWhite,
                                                )),
                                          ],
                                        ),
                                        Ink(
                                          decoration: BoxDecoration(
                                              color: MyColors.sageGreen,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            onTap: () {
                                              cart.add(Cart(
                                                  name: fruit.name,
                                                  image: fruit.image,
                                                  price: fruit.price * fruit.amount,
                                                  amount: fruit.amount));
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    "Added To Cart"
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                              child: Text(
                                                "Add To Cart",
                                                style: GoogleFonts.josefinSans(
                                                    fontSize: 20,
                                                    color: MyColors.pine,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ));
                        }),
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CartPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "Go To Cart!",
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
            ),
          ],
        ),
      ),
    ));
  }
}
