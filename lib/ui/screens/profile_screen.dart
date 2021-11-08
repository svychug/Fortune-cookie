import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookie/ui/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, this.uid}) : super(key: key);

  final String? uid;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String fullName = '';
  String email = '';

  Future fetchData() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid!)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        final Map<String, dynamic> map =
            documentSnapshot.data() as Map<String, dynamic>;
        setState(() {
          fullName = map['first_name'] + ' ' + map['last_name'];
          email = map['email'];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
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
                    AssetImage("assets/images/background_profile_screen.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
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
              ],
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
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((res) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AuthScreen()),
                      (Route<dynamic> route) => false);
                });
              },
            ),
          ),
          const Positioned(
            top: 150,
            left: 170,
            child: Icon(
              Icons.perm_identity,
              color: Colors.pink,
              size: 50,
            ),
          ),
          Positioned(
            top: 200,
            left: 80,
            child: Text(
              fullName,
              style: GoogleFonts.alata(
                color: Color(0xFF000000),
                fontSize: 18,
              ),
            ),
          ),
          Positioned(
            top: 250,
            left: 80,
            child: Text(
              email,
              style: GoogleFonts.alata(
                color: Color(0xFF000000),
                fontSize: 18,
              ),
            ),
          ),
          Positioned(
            top: 600,
            left: 150,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                "PREDICTION",
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
    );
  }
}
