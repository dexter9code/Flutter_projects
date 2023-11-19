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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                                color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
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
                    TextField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
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
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                              color: Theme.of(context).colorScheme.secondary),
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
                              color: Theme.of(context).colorScheme.secondary)),
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
                              color: Theme.of(context).colorScheme.secondary)),
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
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(69, 74, 222, 1),
                                Color.fromRGBO(277, 234, 242, 1)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      width: double.infinity,
                      child: Text(
                        'Log In',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 18,
                                color: const Color.fromRGBO(227, 234, 242, 1)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
