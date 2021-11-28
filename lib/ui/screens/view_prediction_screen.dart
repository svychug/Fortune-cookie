import 'package:cookie/ui/screens/profile_screen.dart';
import 'package:cookie/ui/screens/share_cookie_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewPredictionScreen extends StatefulWidget {
  final String? uid;
  const ViewPredictionScreen({Key? key, required this.uid}) : super(key: key);

  @override
  _ViewPredictionScreenState createState() => _ViewPredictionScreenState();
}

class _ViewPredictionScreenState extends State<ViewPredictionScreen> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    changeVisibility();
  }

  void changeVisibility() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    setState(() {
      isVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 100,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    left: 100,
                    child: AnimatedOpacity(
                      opacity: isVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        "Fortune",
                        style: GoogleFonts.vollkornSc(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 165,
                    child: AnimatedOpacity(
                      opacity: isVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        "Cookie",
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
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/cookie_opened.jpg"),
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
            child: Column(children: [
              AnimatedOpacity(
                opacity: isVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 1000),
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 20),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
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
              ),
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
                            color: Colors.pink, width: 1, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration.zero,
                            pageBuilder: (_, __, ___) => ProfileScreen(uid: widget.uid),
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
                          "GO BACK",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    FlatButton(
                      minWidth: 150,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Colors.pink, width: 1, style: BorderStyle.solid),
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
                    ),
                  ],
                ),
              ),
            ],),
          ),

        ],
      ),
    );
  }
}
