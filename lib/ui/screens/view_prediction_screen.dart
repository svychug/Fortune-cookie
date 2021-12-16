import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cookie/data/predictions.dart';
import 'package:cookie/ui/screens/profile_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:get/get.dart';

class ViewPredictionScreen extends StatefulWidget {
  final String? uid;

  const ViewPredictionScreen({Key? key, required this.uid}) : super(key: key);

  @override
  _ViewPredictionScreenState createState() => _ViewPredictionScreenState();
}

class _ViewPredictionScreenState extends State<ViewPredictionScreen> {
  bool isVisible = false;

  late String prediction;

  void changeVisibility() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    setState(() {
      isVisible = true;
    });
  }

  int generateRandomPredictions() {
    Random random = new Random();
    int randomNumber = random.nextInt(listPredictions.length);
    return randomNumber;
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

  @override
  void initState() {
    super.initState();
    prediction = listPredictions[generateRandomPredictions()];
    changeVisibility();
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
                                    duration: const Duration(milliseconds: 1000),
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
                                padding: const EdgeInsets.only(left: 80, right: 55),
                                child: Text(
                                  prediction,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.vollkornSc(
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.03,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex:1,
                      child: Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/cookie_opened.jpg"),
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
                                  width: MediaQuery.of(context).size.width * 0.18,
                                  height:
                                      MediaQuery.of(context).size.height * 0.045,
                                  child: Text(
                                    prediction,
                                    style: GoogleFonts.vollkornSc(
                                      fontSize: 4,
                                    ),
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
