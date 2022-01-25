import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookie/ui/screens/buy_cookies_screen.dart';
import 'package:cookie/ui/screens/user_settings_screen.dart';
import 'package:cookie/ui/screens/view_prediction_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  final String? uid;

  const ProfileScreen({Key? key, required this.uid}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with WidgetsBindingObserver {
  bool isShowAnimation = false;
  bool isVisible = true;

  late AssetImage imageGif;
  bool _isButtonDisabled = false;

  static AudioCache player = AudioCache();
  static const alarmAudioPath = "audio/sound_cookie.mp3";

  late Timer _timer;
  late int _start;

  late Future<bool> _webCall;
  late int cookies;
  late int openPredictions;
  late DateTime freeCookie;
  late Duration difference;
  late bool timer;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          fetchData()
              .whenComplete(() => checkDifferenceInTime())
              .whenComplete(() => fetchData())
              .whenComplete(() => checkButton());
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours) + 'h'.tr}:${twoDigitMinutes + 'm'.tr}:${twoDigitSeconds + 's'.tr}";
  }

  void checkDifferenceInTime() {
    DateTime _now = DateTime.now();
    DateTime _end = freeCookie.add(const Duration(hours: 24));
    difference = _now.difference(freeCookie);

    _start = _end.millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond -
        _now.millisecondsSinceEpoch ~/
            Duration
                .millisecondsPerSecond; //(_end.millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond) - _now.millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond;

    if (_now.isAfter(_end) && timer == true) {
      updateUserCookies();
    }
  }

  Future<void> updateTimeStampForZero() {
    return users.doc(widget.uid!).update({
      'free_cookie_timer': Timestamp.now(),
      'timer': true,
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

  Future<void> updateUserCookies() {
    return users.doc(widget.uid!).update({
      'cookies': cookies + 1,
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

  Future<void> updateUser() {
    return users.doc(widget.uid!).update({
      'cookies': cookies - 1,
      'open_predictions': openPredictions + 1,
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
          openPredictions = map['open_predictions'];
          freeCookie = map['free_cookie_timer'].toDate();
          timer = map['timer'];
        });
      }
    });
    return true;
  }

  void changePicture() async {
    setState(() {
      isShowAnimation = true;
      isVisible = false;
    });
    await Future.delayed(const Duration(milliseconds: 4500), () {});
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: ViewPredictionScreen(uid: widget.uid),
      ),
    );
  }

  void runSound() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    player.play(alarmAudioPath);
  }

  void checkButton() {
    cookies == 0 ? {_isButtonDisabled = true} : {_isButtonDisabled = false};
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
    startTimer();
    imageGif = const AssetImage("assets/images/cookie_gif.gif");
    _webCall = fetchData()
        .whenComplete(() => checkDifferenceInTime())
        .whenComplete(() => fetchData())
        .whenComplete(() => checkButton());
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    imageGif.evict();
    _timer.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      fetchData()
          .whenComplete(() => checkDifferenceInTime())
          .whenComplete(() => fetchData())
          .whenComplete(() => checkButton());
    }
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
            return Column(
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
                                child: AnimatedOpacity(
                                  opacity: isVisible ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 1000),
                                  child: IconButton(
                                      icon: const Icon(
                                        Icons.format_list_bulleted,
                                        color: Color(0xFFFEC480),
                                        size: 40,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UserSettingsScreen(
                                                    uid: widget.uid),
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                height: 55,
                                width: 200,
                                child: Stack(
                                  children: [
                                    AnimatedOpacity(
                                      opacity: isVisible ? 1.0 : 0.0,
                                      duration:
                                          const Duration(milliseconds: 1000),
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
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                      AnimatedOpacity(
                        opacity: isVisible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 1000),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'free_cookie'.tr,
                                          style: GoogleFonts.roboto(
                                            color: Colors.pink,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          _isButtonDisabled
                                              ? _printDuration(
                                                  Duration(seconds: _start))
                                              : '24' +
                                                  'h'.tr +
                                                  ':00' +
                                                  'm'.tr +
                                                  ':00' +
                                                  's'.tr,
                                          style: GoogleFonts.roboto(
                                            color: const Color(0xFFFEC480),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: SizedBox(
                                        width: 200,
                                        child: LinearProgressIndicator(
                                          minHeight: 7,
                                          value: _isButtonDisabled
                                              ? _start / 86400
                                              : 1.0,
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                  Color>(Colors.pink),
                                          backgroundColor: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/little_cookie.jpg"),
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.pink),
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Text(
                                            cookies.toString(),
                                            style: GoogleFonts.roboto(
                                              color: Colors.pink,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
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
                                          return BuyCookiesScreen(
                                              uid: widget.uid);
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      image: !isShowAnimation
                          ? const DecorationImage(
                              image:
                                  AssetImage("assets/images/cookie_closed.jpg"),
                              fit: BoxFit.scaleDown,
                            )
                          : DecorationImage(
                              image: imageGif,
                              fit: BoxFit.scaleDown,
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 1,
                  child: AnimatedOpacity(
                    opacity: isVisible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1000),
                    child: Column(
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.only(
                                  left: 30, right: 30, top: 10, bottom: 10),
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
                          onPressed: _isButtonDisabled
                              ? () {
                                  showGeneralDialog(
                                    barrierLabel: "Label",
                                    barrierDismissible: true,
                                    barrierColor: Colors.black.withOpacity(0.5),
                                    transitionDuration:
                                        const Duration(milliseconds: 500),
                                    context: context,
                                    pageBuilder: (context, anim1, anim2) {
                                      return Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          height: 250,
                                          child: AlertDialog(
                                            content: Text('zero_cookies'.tr),
                                            actions: [
                                              TextButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.pink),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  'ok'.tr,
                                                  style: GoogleFonts.roboto(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          margin: const EdgeInsets.only(
                                            left: 12,
                                            right: 12,
                                          ),
                                        ),
                                      );
                                    },
                                    transitionBuilder:
                                        (context, anim1, anim2, child) {
                                      return SlideTransition(
                                        position: Tween(
                                                begin: const Offset(0, -1),
                                                end: const Offset(0, 0))
                                            .animate(anim1),
                                        child: child,
                                      );
                                    },
                                  );
                                }
                              : () {
                                  runSound();
                                  changePicture();
                                  imageGif.evict();
                                  updateUser().whenComplete(() {
                                    cookies = cookies - 1;
                                    if (cookies == 0) {
                                      updateTimeStampForZero();
                                    }
                                  });
                                },
                          child: Text(
                            'view_prediction'.tr,
                            textAlign: TextAlign.center,
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
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
