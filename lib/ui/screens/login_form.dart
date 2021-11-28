import 'package:cookie/ui/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  List<String> listDomains = [
    '@mail.ru',
    '@gmail.com',
    '@yandex.ru',
    '@iсloud.com',
    '@yahoo.com',
  ];
  final _formKey = GlobalKey<FormState>();

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
        key: _formKey,
        height: 100,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                    return 'Enter Email Address';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email address!';
                  } else if (!listDomains.contains(value.substring(value.indexOf('@'),value.length))){
                    return 'Please enter a valid email domain';
                  }
                  return null;
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
                    return 'Password must be atleast 6 characters!';
                  }
                  return null;
                },
                obscureText: _obscureText,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Forgot password?",
                    style: GoogleFonts.roboto(
                      color: Colors.pink,
                      fontSize: 18,
                    ),
                  ),
                ),
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
                            logInToFirebase();
                          },
                          child: Text(
                            "LOGIN",
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
      ),
    );
  }

  void logInToFirebase() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      isLoading = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileScreen(uid: result.user!.uid)),
      );
    }).catchError(
      (err) {
        showGeneralDialog(
          barrierLabel: "Label",
          barrierDismissible: true,
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: const Duration(milliseconds: 500),
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
                        MaterialStateProperty.all<Color>(Colors.pink),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Ok",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(left: 12, right: 12,),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            );
          },
          transitionBuilder: (context, anim1, anim2, child) {
            return SlideTransition(
              position: Tween(begin: const Offset(0, -1), end: const Offset(0, 0)).animate(anim1),
              child: child,
            );
          },
        );
      },
    );
  }
}
