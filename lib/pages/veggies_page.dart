import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabjiwallah/constants/colors.dart';
import 'package:sabjiwallah/constants/lists.dart';
import 'package:sabjiwallah/models/cart.dart';
import 'package:sabjiwallah/models/vegetables.dart';
import 'package:sabjiwallah/pages/fruits_page.dart';
import 'package:sabjiwallah/widgets/circular_design_widget.dart';

import '../widgets/my_appbar_widget.dart';

class VeggiesPage extends StatefulWidget {
  const VeggiesPage({super.key});

  @override
  State<VeggiesPage> createState() => _VeggiesPageState();
}

class _VeggiesPageState extends State<VeggiesPage> {
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
                    const MyAppbarWidget(title: "Choose Veggies"),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: vegetables.length,
                        itemBuilder: (context, index) {
                          Vegetables vegetable = vegetables[index];
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
                                              vegetable.image,
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
                                            vegetable.name,
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
                                          "₹ ${vegetable.price.toString()}",
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
                                                    vegetable.amount--;
                                                  });
                                                },
                                                icon: const Icon(
                                                  CupertinoIcons.back,
                                                  color:
                                                      MyColors.antiFlashWhite,
                                                )),
                                            Text(
                                              vegetable.amount
                                                  .round()
                                                  .toString(),
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    vegetable.amount++;
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
                                                  name: vegetable.name,
                                                  image: vegetable.image,
                                                  price: vegetable.price * vegetable.amount,
                                                  amount: vegetable.amount));
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
                              builder: (context) => const FruitsPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "Next",
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
