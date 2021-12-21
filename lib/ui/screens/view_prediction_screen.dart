import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookie/ui/screens/profile_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:get/get.dart';
//import 'package:timeago/timeago.dart' as timeago;

class ViewPredictionScreen extends StatefulWidget {
  final String? uid;

  const ViewPredictionScreen({Key? key, required this.uid}) : super(key: key);

  @override
  _ViewPredictionScreenState createState() => _ViewPredictionScreenState();
}

class _ViewPredictionScreenState extends State<ViewPredictionScreen> {
  bool isVisible = false;

  late Future<bool> _webCall;
  late String prediction;
  late List<dynamic> excludedPredictions;
  late int randomNumberCount;
  late int lengthPredictions;

  List<int> excludedPredictionsNumber = [];

  void changeVisibility() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    setState(() {
      isVisible = true;
    });
  }

  Future<bool> fetchLengthPredictions() async {
    await FirebaseFirestore.instance
        .collection('predictions')
        .doc('67CXLD94k02MWGzK79k8')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        final Map<String, dynamic> map =
            documentSnapshot.data() as Map<String, dynamic>;
        setState(() {
          lengthPredictions = map['predictions'].length;
        });
      }
    });
    return true;
  }

  Future<bool> fetchExcludedPredictions() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid!)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        final Map<String, dynamic> map =
            documentSnapshot.data() as Map<String, dynamic>;
        setState(() {
          excludedPredictions = map['array_excluded_predictions'];
        });
      }
    });
    return true;
  }

  Future<void> updateExcludedPredictions() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid!)
        .update({'array_excluded_predictions': excludedPredictions}).then(
            (value) {
      if (kDebugMode) {
        print("User's Property Updated");
      }
    }).catchError((error) {
      if (kDebugMode) {
        print("Failed to update user's property: $error");
      }
    });
  }

  Future<bool> fetchPrediction() async {
    await FirebaseFirestore.instance
        .collection('predictions')
        .doc('67CXLD94k02MWGzK79k8')
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        final Map<String, dynamic> map =
            documentSnapshot.data() as Map<String, dynamic>;
        setState(() {
          prediction = map['predictions'][generateRandomPredictions(
              map['predictions'].length, excludedPredictionsNumber)];
        });
      }
    });
    return true;
  }

  int generateRandomPredictions(
      int sizeArrayOfPredictions, List<int> excludedPredictionsNumber) {
    List<int> countPredictions =
        List.generate(sizeArrayOfPredictions, (index) => index);
    countPredictions
        .removeWhere((element) => excludedPredictionsNumber.contains(element));
    Random random = Random();
    int randomNumber = random.nextInt(countPredictions.length);
    randomNumberCount = countPredictions[randomNumber];
    return countPredictions[randomNumber];
  }

  void saveScreen() async {
    RenderRepaintBoundary? boundary =
        scr.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary!.debugNeedsPaint) {
      Timer(const Duration(seconds: 1), () => saveScreen());
      return null;
    }
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final result =
        await ImageGallerySaver.saveImage(byteData!.buffer.asUint8List());
    if (kDebugMode) {
      print('$byteData ********** Saved to gallery *********** $result');
    }
    _showInSnackBar(message: 'saved_scr'.tr);
  }

  void _showInSnackBar({required String message}) {
    _scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        duration: (const Duration(seconds: 1)),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
    );
  }

  void checkExcludedPredictions() {
    DateTime _now = DateTime.now();
    List<dynamic> copyExcludedPredictions = List.from(excludedPredictions);
    for (var element in copyExcludedPredictions) {
      DateTime _serverTime = element['date'].toDate();
      if (!_now.isBefore(_serverTime.add(const Duration(days: 180)))) {
        excludedPredictions.remove(element);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _webCall = fetchLengthPredictions()
        .whenComplete(() => fetchExcludedPredictions())
        .whenComplete(() {
          checkExcludedPredictions();
          for (var element in excludedPredictions) {
            excludedPredictionsNumber.add(element['number']);
          }
        })
        .whenComplete(() {
          if (excludedPredictions.length == lengthPredictions) {
            excludedPredictions = [];
            excludedPredictionsNumber = [];
          }
        })
        .whenComplete(() => fetchPrediction())
        .whenComplete(() {
          Map<String, dynamic> map = {
            'date': Timestamp.fromDate(DateTime.now()),
            'number': randomNumberCount,
          };
          excludedPredictions.add(map);
          updateExcludedPredictions();
        })
        .whenComplete(() => changeVisibility());
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey scr = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: RepaintBoundary(
              key: scr,
              child: Scaffold(
                body: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          SizedBox(
                            height: 55,
                            width: 200,
                            child: Stack(
                              children: [
                                AnimatedOpacity(
                                  opacity: isVisible ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 1000),
                                  child: Text(
                                    'fortune'.tr,
                                    style: GoogleFonts.vollkornSc(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 20,
                                  left: 65,
                                  child: AnimatedOpacity(
                                    opacity: isVisible ? 1.0 : 0.0,
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    child: Text(
                                      'cookie'.tr,
                                      style: GoogleFonts.vollkornSc(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                image: AssetImage("assets/images/popup.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: isVisible ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 1000),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 90, right: 60),
                                child: FutureBuilder(
                                  future: _webCall,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      return Text(
                                        prediction,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.vollkornSc(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                          color: Colors.white,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
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
                                    "assets/images/cookie_opened.jpg"),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: isVisible ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 1000),
                            child: Center(
                              child: RotationTransition(
                                turns: const AlwaysStoppedAnimation(-20 / 360),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.18,
                                  height: MediaQuery.of(context).size.height *
                                      0.045,
                                  child: FutureBuilder(
                                    future: _webCall,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else {
                                        return Text(
                                          prediction,
                                          style: GoogleFonts.vollkornSc(
                                            fontSize: 4,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                /*AnimatedOpacity(
                    opacity: isVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1000),
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.only(
                              left: 30, right: 30, top: 20, bottom: 20),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.pink),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const ShareCookieScreen();
                          }),
                        );
                      },
                      child: Text(
                        "SHARE COOKIE",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),*/
                const SizedBox(
                  height: 10,
                ),
                AnimatedOpacity(
                  opacity: isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        minWidth: 150,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.pink,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration.zero,
                              pageBuilder: (_, __, ___) =>
                                  ProfileScreen(uid: widget.uid),
                            ),
                            /*MaterialPageRoute(
                            builder: (context) => ProfileScreen(uid: widget.uid),
                          ),*/
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 20),
                          child: Text(
                            'back'.tr,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: isVisible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 1000),
                        child: SizedBox(
                          width: 150,
                          child: TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.only(
                                    left: 20, right: 20, top: 20, bottom: 20),
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
                              saveScreen();
                            },
                            child: Text(
                              'save'.tr,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      /*FlatButton(
                          minWidth: 150,
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.pink,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 20),
                            child: Text(
                              "SAVE",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),*/
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
