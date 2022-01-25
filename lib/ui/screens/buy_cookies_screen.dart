import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookie/api/purchase_api.dart';
import 'package:cookie/ui/screens/profile_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/models/offering_wrapper.dart';
import 'package:purchases_flutter/models/package_wrapper.dart';

class BuyCookiesScreen extends StatefulWidget {
  final String? uid;

  const BuyCookiesScreen({Key? key, required this.uid}) : super(key: key);

  @override
  _BuyCookiesScreenState createState() => _BuyCookiesScreenState();
}

class _BuyCookiesScreenState extends State<BuyCookiesScreen> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;

  late Future<bool> _webCall;
  late int cookies;
  late List<Offering> offerings;
  late bool isSuccess;
  bool isLoading = false;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<bool> fetchData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid!)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        final Map<String, dynamic> map =
            documentSnapshot.data() as Map<String, dynamic>;
        setState(() {
          cookies = map['cookies'];
        });
      }
    });
    return true;
  }

  Future<void> updateUserCookies(int countCookies) {
    return users.doc(widget.uid!).update({
      'cookies': cookies + countCookies,
      'timer': false,
    }).then((value) {
      if (kDebugMode) {
        print("User Updated");
      }
    }).catchError((error) {
      if (kDebugMode) {
        print("Failed to update user: $error");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _webCall = fetchData().whenComplete(() => fetchOffers());
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future fetchOffers() async {
    offerings = await PurchaseApi.fetchOffersByIds(Cookies.allIds);
  }

  Future makePurchase(List<Package> packages, int index) async {
    isSuccess = await PurchaseApi.purchasePackage(packages[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _webCall,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SingleChildScrollView(
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
                                                color: Theme.of(context)
                                                    .primaryColor,
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
                                                  color: Theme.of(context)
                                                      .primaryColor,
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
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSelected1 = true;
                                        isSelected2 = false;
                                        isSelected3 = false;
                                        isSelected4 = false;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '1',
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/little_cookie.jpg"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 200,
                                              child: Divider(
                                                thickness: isSelected1 ? 4 : 2,
                                                color: isSelected1
                                                    ? Colors.pink
                                                    : null,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          '29р',
                                          style: GoogleFonts.rochester(
                                            fontSize: 24,
                                            color: isSelected1
                                                ? Colors.pink
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSelected2 = true;
                                        isSelected1 = false;
                                        isSelected3 = false;
                                        isSelected4 = false;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/little_cookie.jpg"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 200,
                                              child: Divider(
                                                thickness: isSelected2 ? 4 : 2,
                                                color: isSelected2
                                                    ? Colors.pink
                                                    : null,
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
                                            color: isSelected2
                                                ? Colors.pink
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSelected3 = true;
                                        isSelected1 = false;
                                        isSelected2 = false;
                                        isSelected4 = false;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/little_cookie.jpg"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 200,
                                              child: Divider(
                                                thickness: isSelected3 ? 4 : 2,
                                                color: isSelected3
                                                    ? Colors.pink
                                                    : null,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          '179р',
                                          style: GoogleFonts.rochester(
                                            fontSize: 24,
                                            color: isSelected3
                                                ? Colors.pink
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSelected4 = true;
                                        isSelected1 = false;
                                        isSelected2 = false;
                                        isSelected3 = false;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '20',
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/little_cookie.jpg"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 200,
                                              child: Divider(
                                                thickness: isSelected4 ? 4 : 2,
                                                color: isSelected4
                                                    ? Colors.pink
                                                    : null,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          '279р',
                                          style: GoogleFonts.rochester(
                                            fontSize: 24,
                                            color: isSelected4
                                                ? Colors.pink
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                                onPressed: () {
                                  if (offerings.isEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text('no_plans'.tr),
                                    ));
                                  } else {
                                    final packages = offerings
                                        .map((offer) => offer.availablePackages)
                                        .expand((pair) => pair)
                                        .toList();

                                    int index = 0;
                                    if (isSelected1) {
                                      index = 3;
                                    } else if (isSelected2) {
                                      index = 1;
                                    } else if (isSelected3) {
                                      index = 0;
                                    } else if (isSelected4) {
                                      index = 2;
                                    }

                                    setState(() {
                                      isLoading = true;
                                    });
                                    makePurchase(packages, index)
                                        .whenComplete(() {
                                      if (isSuccess) {
                                        if (isSelected1) {
                                          updateUserCookies(1);
                                        } else if (isSelected2) {
                                          updateUserCookies(5);
                                        } else if (isSelected3) {
                                          updateUserCookies(10);
                                        } else if (isSelected4) {
                                          updateUserCookies(20);
                                        }
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileScreen(
                                                        uid: widget.uid)),
                                            (Route<dynamic> route) => false);
                                      }
                                    });
                                  }
                                },
                                child: const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.pink,
                                  size: 40,
                                ),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.only(
                                        left: 50,
                                        right: 50,
                                        top: 10,
                                        bottom: 10),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
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
                  );
          }
        },
      ),
    );
  }
}
