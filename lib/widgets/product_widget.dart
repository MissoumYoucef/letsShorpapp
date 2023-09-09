import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/utils/colors.dart';
import 'package:store_app/utils/utils.dart';

import '../data/data.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: product.color,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Transform.rotate(
              angle: 2.05*pi,
              child: Image.asset(
                product.image,
                height: 80,
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: 30,
              width: 30,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: Icon(
                FontAwesomeIcons.solidHeart,
                color: product.isSelected ? kPrimaryColor:Colors.black38,
                size: 15,),
            ),  
          ),
          Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow:[
                  BoxShadow(
                    color: product.color.withOpacity(0.5),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: const Offset(0,1)
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                  style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 5,),
                  priceWidget(product.price),
                  const SizedBox(height: 5,),
                  Row(
                    children: const [
                      Text('See More'),
                      SizedBox(height: 5,),
                      Icon(
                        FontAwesomeIcons.arrowTrendDown,
                        color: kPrimaryColor,
                        size: 15,),
                    ],
                  )
                ],
              ),
            ),  
          )
        ],
      ),
    );
  }
}
