import 'package:flutter/material.dart';
import 'package:store_app/utils/colors.dart';

final boxShadow = [
  BoxShadow(color: Colors.black.withAlpha(1), blurRadius: 15, spreadRadius: 10)
];
Widget iconWidget(IconData icon, bool doExists) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(color: Colors.white, boxShadow: boxShadow),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Icon(icon),
        if (doExists)
          Positioned(
              child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
                color: kPrimaryColor, shape: BoxShape.circle),
          ))
      ],
    ),
  );
}

Widget priceWidget(String price) {
  return RichText(
    text: TextSpan(
      children:[
        TextSpan(
          text: "\$$price",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          )
        ),
        const TextSpan(
          text: "/Kg",
          style: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.bold
          )
        ),
      ]
    ));
}
