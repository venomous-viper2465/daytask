import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CtaButton extends StatelessWidget {
  CtaButton({super.key, required this.buttonText, required this.onPressed});

  final String buttonText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 254, 211, 106),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
            textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 15,
        )),
      ),
    );
  }
}
