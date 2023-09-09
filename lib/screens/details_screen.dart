import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/data/data.dart';
import 'package:store_app/utils/colors.dart';
import 'package:store_app/utils/utils.dart';
import 'package:store_app/widgets/nutritiens_widget.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            color: widget.product.color,
            padding: const EdgeInsets.all(20.0),
            child: Transform.rotate(
              angle: 2.10 * pi,
              child: Image.asset(widget.product.image),
            ),
          ),
          Positioned(
              top: 59,
              right: 20,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: iconWidget(FontAwesomeIcons.arrowLeft, false),
                  ),
                  const Text(
                    'Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: iconWidget(FontAwesomeIcons.bagShopping, true),
                  )
                ],
              )),
          Container(
              width: size.width,
              margin: EdgeInsets.only(top: size.height * 0.55),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: size.height * 0.55,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.name,
                                style: const TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              priceWidget(widget.product.price)
                            ],
                          ),
                          Container(
                            width: 130,
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: boxShadow),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //decrease quantity
                                quantityIcon(
                                    onTab: () {},
                                    color: kSecondaryColor,
                                    icon: FontAwesomeIcons.minus),

                                Text(
                                  itemCount.toString(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),

                                //increase quantity
                                quantityIcon(
                                    onTab: () {},
                                    color: kPrimaryColor,
                                    icon: FontAwesomeIcons.plus),
                              ],
                            ),
                            //Netrutients
                          )
                        ],
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: 4,
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          ),
                        itemBuilder: (context, index) {
                          return NutrientWidget(
                              product: data[0].products![index], index: index);
                        },
                      )
                    ],
                  ),
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Details",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Missoum'
                    )
                  ]),
            )
        ],
      ),
    );
  }

  Widget quantityIcon(
      {required VoidCallback onTab,
      required Color color,
      required IconData icon}) {
    return InkWell(
      onTap: onTab,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: boxShadow),
        child: Icon(
          icon,
          color: color == kPrimaryColor ? Colors.white : kPrimaryColor,
        ),
      ),
    );
  }
}
