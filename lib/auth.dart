import 'package:daytask/home.dart';
import 'package:daytask/widgets/cta_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication extends StatefulWidget {
  Authentication({super.key});

  @override
  State<Authentication> createState() {
    return _AuthenticationState();
  }
}

class _AuthenticationState extends State<Authentication> {
  final emailId = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? userEmail;
  String? userPassword;
  String? userFullName;
  var _login = true;

  void _submit() {
    print('submit called');
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    print(userEmail!);
    print(userPassword);
    print(userFullName);

    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset('lib/assets/images/logo.png')),
                SizedBox(
                  height: 40,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!_login)
                          Text(
                            'Create your account',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                        if (_login)
                          Text(
                            'Welcome Back!',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                        SizedBox(
                          height: 20,
                        ),
                        if (!_login)
                          Text(
                            'Full Name',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 140, 170, 185))),
                          ),
                        if (!_login)
                          const SizedBox(
                            height: 10,
                          ),
                        if (!_login)
                          TextFormField(
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            )),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 69, 90, 100),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0),
                                ),
                                prefixIcon: Icon(
                                  Icons.person_outline_rounded,
                                  color: Colors.white,
                                )),
                            controller: fullName,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.trim().length < 4) {
                                return "Name must be at least 4 characters long";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userFullName = value;
                            },
                          ),
                        if (!_login)
                          const SizedBox(
                            height: 20,
                          ),
                        Text(
                          'Email Address',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 140, 170, 185))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 69, 90, 100),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 0),
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                              )),
                          controller: emailId,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.trim().length < 4 ||
                                !value.contains('@')) {
                              return "Invalid email";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            userEmail = value;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Password',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 140, 170, 185))),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          )),
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 69, 90, 100),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0)),
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: Colors.white,
                              )),
                          controller: password,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.trim().length < 5) {
                              return "Password must be 5 characters long";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            userPassword = value;
                          },
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  width: double.infinity,
                  height: 56,
                  child: CtaButton(
                    buttonText: _login == true ? 'Log In' : 'Sign up',
                    onPressed: _submit,
                  ),
                ),
                Divider(
                  color: Color.fromARGB(255, 140, 170, 185), // line color
                  thickness: 1, // line thickness
                  height: 48, // space above and below the line
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _login == true
                          ? 'Don\'t have an account?'
                          : 'Already have an account',
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                        color: Color.fromARGB(255, 140, 170, 185),
                        fontSize: 16,
                      )),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _login = !_login;
                        });
                      },
                      child: Text(
                        _login == true ? 'Sign up' : 'Log In',
                        style: TextStyle(
                          color: Color.fromARGB(255, 254, 211, 106),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
