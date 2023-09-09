import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:store_app/screens/home_screen.dart';
import 'package:store_app/utils/colors.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'HAY Markets',
              style: TextStyle(
                  fontSize: 18,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.1),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'First Online',
              style: TextStyle(
                  fontSize: 60,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.1),
            ),
            const Text(
              'Market',
              style: TextStyle(
                  fontSize: 60,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.1),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Our market always provide fresh item from the local farmers, let s support local with us',
              style: TextStyle(
                color: Colors.black,
                height: 1.4,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/bg.png'),
            ),
            const Spacer(),
            Column(
              children: [
                //Slider
                SlideAction(
                  borderRadius: 80,
                  outerColor: kPrimaryColor,
                  sliderButtonIcon: const Icon(
                    FontAwesomeIcons.rightLeft,
                    size: 30,
                    color: kPrimaryColor,
                  ),
                  text: 'Swipe to Start',
                  onSubmit: () {
                    Timer(const Duration(microseconds: 500), () {
                      Navigator.push(context,
                                     MaterialPageRoute(
                                      builder:(context) => const HomeScreen(),));
                    });
                  },
                ),
                const SizedBox(height: 20,),
                RichText(text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'How To Support ',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2
                      )
                    ),
                    TextSpan(
                      text: 'Local Framers',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        letterSpacing: 1.2
                      )
                    )
                  ]
                )
              )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
