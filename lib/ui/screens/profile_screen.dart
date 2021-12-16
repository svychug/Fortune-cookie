import 'package:cookie/ui/screens/buy_cookies_screen.dart';
import 'package:cookie/ui/screens/user_settings_screen.dart';
import 'package:cookie/ui/screens/view_prediction_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  final String? uid;

  const ProfileScreen({Key? key, required this.uid}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late AssetImage imageGif;
  bool isShowAnimation = false;
  bool isVisible = true;

  static AudioCache player = new AudioCache();
  static const alarmAudioPath = "audio/sound_cookie.mp3";

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

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    final info = statuses[Permission.storage].toString();
    if (kDebugMode) {
      print(info);
    }
  }

  @override
  void initState() {
    super.initState();
    _requestPermission();
    imageGif = const AssetImage("assets/images/cookie_gif.gif");
  }

  @override
  void dispose() {
    imageGif.evict();
    super.dispose();
  }

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
                        top:15,
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
                                          UserSettingsScreen(uid: widget.uid),
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
                                    'time'.tr,
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
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: 200,
                                  child: LinearProgressIndicator(
                                    minHeight: 7,
                                    value: 0.5,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.pink),
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
                                      "3",
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
                                    borderRadius: BorderRadius.circular(18.0),
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
                        image: AssetImage("assets/images/cookie_closed.jpg"),
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () {
                      runSound();
                      changePicture();
                      imageGif.evict();
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
      ),
    );
  }
}
