import 'package:cookie/ui/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                Positioned(
                  top: 100,
                  child: IconButton(
                      icon: const Icon(
                        Icons.format_list_bulleted,
                        color: Color(0xFFFEC480),
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ),
              ],
            ),
          ),
          Padding(
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
                            "free cookie:",
                            style: GoogleFonts.roboto(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "12ч:10м:53c",
                            style: GoogleFonts.roboto(
                              color: Color(0xFFFEC480),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 200,
                          child: const LinearProgressIndicator(
                            minHeight: 7,
                            value: 0.5,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
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
                              image:
                                  AssetImage("assets/images/little_cookie.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.pink),
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
                            MaterialStateProperty.all<Color>(Colors.pink),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "+ ADD",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 320,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/cookie.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 50,),
          TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.only(
                    left: 30, right: 30, top: 10, bottom: 10),
              ),
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.pink),
              shape:
              MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Container();
                }),
              );
            },
            child: Text(
              "VIEW \nPREDICTION",
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
    );
  }
}
