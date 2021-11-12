import 'package:cookie/ui/screens/buy_cookies_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewPredictionScreen extends StatefulWidget {
  const ViewPredictionScreen({Key? key}) : super(key: key);

  @override
  _ViewPredictionScreenState createState() => _ViewPredictionScreenState();
}

class _ViewPredictionScreenState extends State<ViewPredictionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 80,
                  left: 120,
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
                  left: 185,
                  child: Text(
                    "Cookie",
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
          const SizedBox(
            height: 100,
          ),
          Container(
            width: double.infinity,
            height: 320,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/background_view_prediction_screen.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            onPressed: () {
              /*
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Container();
                }),
              );*/
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
          const SizedBox(
            height: 10,
          ),
          Row(
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
                  Navigator.of(context).pop();
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
          )
        ],
      ),
    );
  }
}
