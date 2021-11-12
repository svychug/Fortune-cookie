import 'package:cookie/ui/screens/user_settings_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  List<String> listDomains = [
    '@mail.ru',
    '@gmail.com',
    '@yandex.ru',
    '@iсloud.com',
    '@yahoo.com',
  ];
  final _formKeySignUp = GlobalKey<FormState>();
  final _fireStore = FirebaseFirestore.instance;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SizedBox(
        key: _formKeySignUp,
        height: 100,
        width: double.infinity,
        child: Column(
          children: [
            TextFormField(
              controller: firstNameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: const UnderlineInputBorder(),
                labelText: 'FIRST NAME',
                labelStyle: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter First Name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: lastNameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: const UnderlineInputBorder(),
                labelText: 'LAST NAME',
                labelStyle: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Last Name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: const UnderlineInputBorder(),
                labelText: 'EMAIL',
                labelStyle: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter an Email Address';
                } else if (!value.contains('@')) {
                  return 'Please enter a valid email address';
                } else if (!listDomains.contains(value.substring(value.indexOf('@'),value.length))){
                  return 'Please enter a valid email domain';
                } return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: const UnderlineInputBorder(),
                labelText: 'PASSWORD',
                hintStyle: const TextStyle(color: Colors.white),
                hintText: 'Password is at least 6 characters',
                labelStyle: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 18,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    !_obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.pink,
                  ),
                  onPressed: _toggle,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Password';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters!';
                }
                return null;
              },
              obscureText: _obscureText,
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: SizedBox(
                height: 40,
                width: 150,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : TextButton(
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
                        onPressed: () {
                          registerToFirebase();
                        },
                        child: Text(
                          "SIGN UP",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void registerToFirebase() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then(
      (result) {
        _fireStore.collection('users').doc(result.user!.uid).set({
          'first_name': firstNameController.text,
          'last_name': lastNameController.text,
          'uid': result.user!.uid,
          'email': emailController.text,
        }).then((value) {
          isLoading = false;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    UserSettingsScreen(uid: result.user!.uid)),
          );
        }).catchError(
          (err) {
            showGeneralDialog(
              barrierLabel: "Label",
              barrierDismissible: true,
              barrierColor: Colors.black.withOpacity(0.5),
              transitionDuration: Duration(milliseconds: 500),
              context: context,
              pageBuilder: (context, anim1, anim2) {
                return Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 250,
                    child: AlertDialog(
                      content: Text(err.message),
                      actions: [
                        ElevatedButton(
                          child: const Text("Ok"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(
                      left: 12,
                      right: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                );
              },
              transitionBuilder: (context, anim1, anim2, child) {
                return SlideTransition(
                  position: Tween(begin: Offset(0, -1), end: Offset(0, 0))
                      .animate(anim1),
                  child: child,
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
