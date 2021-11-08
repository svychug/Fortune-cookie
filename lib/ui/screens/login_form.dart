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
    return Form(child:SizedBox(
      key: _formKey,
      height: 100,
      width: double.infinity,
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
              labelStyle: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 18,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  !_obscureText
                      ? Icons.visibility
                      : Icons.visibility_off,
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
                  MaterialStateProperty.all<Color>(
                      Colors.pink),
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
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
    ),);
  }

  void logInToFirebase() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text)
        .then((result) {
      isLoading = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen(uid: result.user!.uid)),
      );
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text(err.message),
              actions: [
                ElevatedButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }
}
