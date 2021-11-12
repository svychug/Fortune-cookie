import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShareCookieScreen extends StatefulWidget {
  const ShareCookieScreen({Key? key}) : super(key: key);

  @override
  _ShareCookieScreenState createState() => _ShareCookieScreenState();
}

class _ShareCookieScreenState extends State<ShareCookieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 200,
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Twitter",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Facebook",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "VK",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Instagram",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
