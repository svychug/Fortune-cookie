/*import 'package:cookie/ui/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _visibleButtons = false;

  void _toggleVissibility() {
    setState(() {
      _visibleButtons = !_visibleButtons;
    });
  }

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
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Stack(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.list,
                    color: Color(0xFFFEC480),
                    size: 36,
                  ),
                  onPressed: _toggleVissibility,
                ),
                Visibility(
                  visible: _visibleButtons,
                  child: Positioned(
                    left: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: const Color(0xFF979797),
                            textStyle: GoogleFonts.roboto(
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const AuthScreen();
                              }),
                            );
                          },
                          child: const Text('LOGIN'),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: const Color(0xFF979797),
                            textStyle: GoogleFonts.roboto(
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return AuthScreen();
                              }),
                            );
                          },
                          child: const Text('SIGN UP'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          _visibleButtons
              ? Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/blurred_cookie.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/cookie.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
*/

