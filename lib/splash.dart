import 'package:daytask/auth.dart';
import 'package:daytask/widgets/cta_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 50),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width - 48 - 93),
                child: Image.asset(
                  'lib/assets/images/logo.png',
                  width: 93,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Image.asset(
                'lib/assets/images/splashimage.jpg',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 40,
              ),
              RichText(
                text: TextSpan(
                  text: 'Manage your task with ',
                  style: GoogleFonts.anton(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 54,
                    ),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'DayTask',
                      style: GoogleFonts.anton(
                        textStyle: TextStyle(
                          color: Color.fromARGB(255, 254, 211, 106),
                          fontSize: 54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: CtaButton(
                  buttonText: 'Let\'s start',
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => Authentication()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
