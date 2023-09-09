import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/data/data.dart';
import 'package:store_app/utils/utils.dart';

class NutrientWidget extends StatelessWidget {
  final Product product;
  final int index;
  const NutrientWidget({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.nutrients[index][0],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                product.nutrients[index][0],
                style: TextStyle(
                  color: product.nutrientsColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(),
          Row(
            children: buildIndicators(
              product.nutrients[index][0], 
              int.parse(product.nutrients[index][1])),
          )
        ],
      ),
    );
  }

  List<Widget> buildIndicators(String nutrientType, int value) {
    List<Widget> list = [];
    for (int i = 0; i < value; i++) {
      list.add(i < value
          ? indicator(true, nutrientType)
          : indicator(false, nutrientType));
    }
    return list;
  }

  Widget indicator(bool isActive, String nutrientType) {
    IconData? icon;
    switch (nutrientType) {
      case "Energy":
        icon = FontAwesomeIcons.bolt;
        break;
      case "Freshness":
        icon = FontAwesomeIcons.glassWater;
        break;
      case "Vitamin":
        icon = Icons.rocket_launch_rounded;
        break;
      case "Calories":
        icon = FontAwesomeIcons.fire;
        break;
      default :
        icon = FontAwesomeIcons.fire; 
    }
    return Container(
      padding: const EdgeInsets.only(top: 10,bottom: 10.0,right: 5.0),
      child: Icon(
        icon,
        color:isActive ? product.nutrientsColor:Colors.black12,
        size: 16,
         ),
    );
  }
}
