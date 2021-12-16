import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

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
          Expanded(
            flex: 2,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 15,
                        child: Align(
                          alignment: Alignment.centerLeft,
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
                      ),
                      Center(
                        child: SizedBox(
                          height: 55,
                          width: 200,
                          child: Stack(
                            children: [
                              Text(
                                'fortune'.tr,
                                style: GoogleFonts.vollkornSc(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Positioned(
                                top: 20,
                                left: 65,
                                child: Text(
                                  'cookie'.tr,
                                  style: GoogleFonts.vollkornSc(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                                          "assets/images/little_cookie.jpg"),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                                          "assets/images/little_cookie.jpg"),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                                          "assets/images/little_cookie.jpg"),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                                          "assets/images/little_cookie.jpg"),
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
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/background_buy_cookies_screen.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
