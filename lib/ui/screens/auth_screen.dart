import 'package:cookie/ui/screens/login_form.dart';
import 'package:cookie/ui/screens/sign_up_form.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'РУССКИЙ', 'locale': const Locale('ru', 'RU')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.back();
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('choose_your_lang'.tr),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          if (kDebugMode) {
                            print(locale[index]['name']);
                          }
                          updateLanguage(locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.pink,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 55,
                width: 200,
                child: Stack(
                  children: [
                    Text(
                      'fortune'.tr,
                      style: GoogleFonts.vollkornSc(
                        color: Theme.of(context).primaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 65,
                      child: Text(
                        'cookie'.tr,
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
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Image.asset('assets/images/russia.png'),
                iconSize: 30,
                onPressed: () {
                  updateLanguage(locale[1]['locale']);
                },
              ),
              IconButton(
                icon: Image.asset('assets/images/united-kingdom.png'),
                iconSize: 30,
                onPressed: () {
                  updateLanguage(locale[0]['locale']);
                },
              ),
            ],
          ),

          /*TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            onPressed: () {
              buildLanguageDialog(context);
            },
            child: Text(
              'change_lang'.tr,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),
          ),*/
          Expanded(
            flex: 2,
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  bottom: TabBar(
                    indicatorColor: Colors.pink,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 5,
                    tabs: [
                      Tab(
                        text: 'signup'.tr,
                      ),
                      Tab(
                        text: 'login'.tr,
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
