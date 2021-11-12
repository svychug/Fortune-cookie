import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookie/ui/screens/auth_screen.dart';
import 'package:cookie/ui/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BuyCookiesScreen extends StatefulWidget {
  const BuyCookiesScreen({Key? key}) : super(key: key);

  @override
  _BuyCookiesScreenState createState() => _BuyCookiesScreenState();
}

class _BuyCookiesScreenState extends State<BuyCookiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 160,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 80,
                  left: 100,
                  child: Text(
                    "Fortune",
                    style: GoogleFonts.vollkornSc(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 165,
                  child: Text(
                    "Cookie",
                    style: GoogleFonts.vollkornSc(
                      color: Theme.of(context).primaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.pink,
                      size: 36,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 120,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '2',
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Icon(
                            Icons.close,
                            color: Colors.pink,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/little_cookie.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 200,
                        child: Divider(
                          thickness: 4,
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    '39р',
                    style: GoogleFonts.rochester(
                      fontSize: 24,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 120,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '5',
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Icon(
                            Icons.close,
                            color: Colors.pink,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/little_cookie.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 200,
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    '69р',
                    style: GoogleFonts.rochester(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 120,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '10',
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.close,
                            color: Colors.pink,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/little_cookie.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 200,
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    '99р',
                    style: GoogleFonts.rochester(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 120,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '50',
                            style: GoogleFonts.roboto(
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.close,
                            color: Colors.pink,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/little_cookie.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 200,
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    '249р',
                    style: GoogleFonts.rochester(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 320,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/background_buy_cookies_screen.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                top:100,
                left: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.pink,
                    size: 40,
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.only(
                          left: 50, right: 50, top: 10, bottom: 10),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
