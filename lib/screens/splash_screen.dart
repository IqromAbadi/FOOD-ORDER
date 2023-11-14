import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_order/screens/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double containerSize = 200;
  double opacity = 0.0;
  bool isZoomed = false;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        setState(() {
          isZoomed = true;
        });
        Timer(
          Duration(seconds: 2),
          () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        );
      },
    );

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        opacity = 1.0;
      });
    });
  }

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * 0.75,
                decoration: BoxDecoration(
                  color: Color(0xFF282828),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(200),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF282828).withOpacity(0.2),
                      spreadRadius: 15,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
              Center(
                child: AnimatedOpacity(
                  duration: Duration(seconds: 2),
                  opacity: opacity,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    width: isZoomed ? containerSize * 1.5 : containerSize,
                    height: isZoomed ? containerSize * 1.5 : containerSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/logo.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 40),
          Text(
            'Enjoy Your Food',
            style: GoogleFonts.poppins(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
