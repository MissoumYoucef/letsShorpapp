import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/data/data.dart';
import 'package:store_app/screens/details_screen.dart';
import 'package:store_app/utils/colors.dart';
import 'package:store_app/utils/utils.dart';

import '../widgets/product_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: kSecondaryColor,
                  backgroundImage: AssetImage('assets/user.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome back',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Missoum youcef',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Spacer(),
                iconWidget(FontAwesomeIcons.bagShopping, true),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: 'get your fresh items \nwith Missoum Youcef',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w400))
            ])),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.7,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: boxShadow,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: const [
                      Icon(FontAwesomeIcons.magnifyingGlass,
                          size: 25, color: kPrimaryColor),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(fontSize: 18, color: Colors.black38),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    FontAwesomeIcons.filter,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      data[index].name,
                      style: TextStyle(
                        color: index == 0 ? kPrimaryColor : Colors.black45,
                        fontWeight:
                            index == 0 ? FontWeight.bold : FontWeight.w400,
                      ),
                    ),
                  );
                },
              ),
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 10, 
                  mainAxisSpacing: 20),
              itemCount: data[0].products!.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, 
                        MaterialPageRoute(builder:(context) => DetailsScreen(product: data[0].products![index]),)
                    );
                  },
                  child: ProductWidget(product: data[0].products![index]),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
