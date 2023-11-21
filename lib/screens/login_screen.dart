import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyLoginScreen extends StatefulWidget {
  const MyLoginScreen({super.key});

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  final String bubbleSvg = 'assets/svg/bubbles.svg';

  void onLoginPressHandler() {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
              height: 90,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Color(0xffc72c41),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: const Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Oh no !!',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Text(
                            'Error While Login In',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ]),
                  ),
                ],
              )),
          Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(20)),
                child: SvgPicture.asset(
                  bubbleSvg,
                  height: 48,
                  width: 48,
                ),
              )),
          Positioned(
              bottom: 0,
              right: 0,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(20)),
                child: SvgPicture.asset(
                  bubbleSvg,
                  height: 48,
                  width: 48,
                ),
              )),
          Positioned(
            top: -10,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/fail.svg',
                  height: 40,
                ),
                Positioned(
                  top: 5,
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  @override
  Widget build(BuildContext context) {
    Image img = Image.asset('assets/bg1.png');
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: img.image, fit: BoxFit.cover)),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  child: Image.asset(
                    'assets/ramen.png',
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Image.asset(
                    'assets/recipe_text.png',
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  'Welcome to Reci-P',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'Get started in only few min.',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Enter Username',
                        hintStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white60,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(225, 235, 161, 57),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white60,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(225, 235, 161, 57),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: onLoginPressHandler,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(255, 162, 0, 1)),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'I accept the terms of use and privacy policy.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
