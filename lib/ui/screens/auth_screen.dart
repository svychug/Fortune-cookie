import 'package:cookie/ui/screens/login_form.dart';
import 'package:cookie/ui/screens/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 130,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 60,
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
                  top: 80,
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
          Expanded(
            flex:2,
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  bottom: const TabBar(
                    indicatorColor: Colors.pink,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 5,
                    tabs: [
                      Tab(
                        text: "SIGN UP",
                      ),
                      Tab(
                        text: "LOGIN",
                      ),
                    ],
                  ),
                ),
                body: const TabBarView(
                  children: [
                    Padding(padding: EdgeInsets.all(25), child: SignUpForm()),
                    Padding(padding: EdgeInsets.all(25), child: LoginForm()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
