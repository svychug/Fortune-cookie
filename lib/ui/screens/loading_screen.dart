/*import 'package:cookie/ui/screens/auth_screen.dart';
import 'package:cookie/ui/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    User? result = FirebaseAuth.instance.currentUser;
    await Future.delayed(const Duration(seconds: 5), () {});

    result != null
        ? Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder:
                (context) => ProfileScreen(),),)

        : Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder:
            (context) => ProfileScreen(),),);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("assets/images/background_loading_screen.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 180,
            left: 20,
            child: Text(
              "Fortune",
              style: GoogleFonts.vollkornSc(
                color: Theme.of(context).primaryColor,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 550,
            left: 180,
            child: Text(
              "Cookie",
              style: GoogleFonts.vollkornSc(
                color: Theme.of(context).primaryColor,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 700,
            left: 160,
            child: Text(
              "LOADING...",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/