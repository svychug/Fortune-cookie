import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  late String _email;
  final auth = FirebaseAuth.instance;
  bool flagButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('reset_pass'.tr),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'email'.tr),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                  _email.isNotEmpty ? flagButton = true : flagButton = false;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                onPressed: flagButton
                    ? () {
                        auth
                            .sendPasswordResetEmail(email: _email)
                            .then((value) => Navigator.of(context).pop())
                            .catchError(
                          (err) {
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
                                      content: Text(err.message),
                                      actions: [
                                        TextButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.pink),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
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
                          },
                        );
                      }
                    : null,
                child: Text(
                  'send_req'.tr,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
