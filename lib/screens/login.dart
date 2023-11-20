// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailText = TextEditingController();
  final _passwordText = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _emailError = false;
  var _passwordError = false;

  @override
  void dispose() {
    _emailText.dispose();
    _passwordText.dispose();
    super.dispose();
  }

  void onPressLoginHandler() {
    final validate = _formKey.currentState!.validate();
    if (validate) {
      _formKey.currentState!.save();
    }
    print(_emailText.text);
    print(_passwordText.text);
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                width: 200,
                // color: Colors.red,
                child: Image.asset('assets/top.png'),
              ),
            ]),
            Expanded(
              child: Container(
                transform: Matrix4.translationValues(0, -60, 0),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: const Color.fromARGB(255, 0, 23, 32),
                                  fontSize: 32),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 200,
                          ),
                          child: Text(
                            "Log in and enjoy the best events around",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          controller: _emailText,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@')) {
                              return 'Please Enter a valid Email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(fontSize: 13),
                          decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onError)),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              // hintText: 'Email',
                              label: Text(
                                'Email',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().length < 6) {
                                      return 'Password Length should be greater than 6';
                                    }
                                    return null;
                                  },
                                  onTap: () {
                                    setState(() {
                                      _passwordError = false;
                                    });
                                  },
                                  controller: _passwordText,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  style: const TextStyle(fontSize: 13),
                                  decoration: InputDecoration(
                                      border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      errorBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.redAccent)),
                                      // hintText: 'Email',
                                      label: Text(
                                        'Password',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary),
                                      )),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Forgot Password?',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  height: 1,
                                  width: double.infinity,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                'or Log In with',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  height: 1,
                                  width: double.infinity,
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          width: double.infinity,
                          // height: 40,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.facebook_outlined,
                                  color: Colors.blueAccent,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Log In with Facebook',
                                  style: GoogleFonts.inter(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          width: double.infinity,
                          // height: 40,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.apple,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Log In with Apple',
                                  style: GoogleFonts.inter(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        InkWell(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24)),
                          onTap: onPressLoginHandler,
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(24)),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 114, 171, 235),
                                      Color.fromARGB(255, 69, 74, 222),
                                      // Color.fromRGBO(69, 74, 222, 1),
                                      // Color.fromRGBO(277, 234, 242, 1)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomCenter)),
                            width: double.infinity,
                            child: Text(
                              'Log In',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 18,
                                      color: const Color.fromRGBO(
                                          227, 234, 242, 1)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 31,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Don’t have an account? ',
                            style: Theme.of(context).textTheme.titleMedium!,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Create an Account',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: primaryColor),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
