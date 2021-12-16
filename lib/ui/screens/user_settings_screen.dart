import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookie/ui/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'buy_cookies_screen.dart';
import 'package:get/get.dart';

class UserSettingsScreen extends StatefulWidget {
  final String? uid;

  const UserSettingsScreen({Key? key, required this.uid}) : super(key: key);

  @override
  _UserSettingsScreenState createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  late Future<bool> _webCall;

  late final String firstName;
  late final String lastName;
  late final String email;

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
          firstName = map['first_name'];
          lastName = map['last_name'];
          email = map['email'];
        });
      }
    });
    return true;
  }

  @override
  void initState() {
    super.initState();
    _webCall = fetchData();
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
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/background_profile_screen.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      flex: 3,
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
                                        Icons.logout,
                                        color: Colors.pink,
                                        size: 36,
                                      ),
                                      onPressed: () {
                                        FirebaseAuth auth =
                                            FirebaseAuth.instance;
                                        auth.signOut().then((res) {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const AuthScreen()),
                                              (Route<dynamic> route) => false);
                                        });
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
                                            color:
                                                Theme.of(context).primaryColor,
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
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.pink),
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          firstName[0].toUpperCase() +
                                              lastName[0].toUpperCase(),
                                          style: GoogleFonts.roboto(
                                            color: Colors.pink,
                                            fontSize: 26,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 50,
                                  child: Container(
                                    height: 20,
                                    width: 30,
                                    color: Colors.transparent,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.pink.shade400,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "3",
                                          style: GoogleFonts.roboto(
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(
                                  email,
                                  style: GoogleFonts.roboto(
                                    color: Colors.grey.shade500,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'open_predictions'.tr,
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(
                                            width: 1, color: Colors.pink),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "2",
                                            style: GoogleFonts.roboto(
                                              color: Colors.pink,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.pink),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return const BuyCookiesScreen();
                                      }),
                                    );
                                  },
                                  child: Text(
                                    'add'.tr,
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.only(
                                    left: 30, right: 30, top: 20, bottom: 20),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.pink),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'prediction'.tr,
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            );
          }
        },
      ),
    );
  }
}
