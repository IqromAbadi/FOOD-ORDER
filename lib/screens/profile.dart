import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_order/widget/button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _AppBar(context),
            Expanded(
              child: _Body(context),
            ),
          ],
        ),
      ),
    );
  }
}

_AppBar(context) {
  double screenHeight = MediaQuery.of(context).size.height;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Stack(
        children: [
          Container(
            height: screenHeight * .19,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF282828),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 30,
              right: 30,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Iqrom.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                SizedBox(height: 3),
                Stack(
                  children: [
                    Container(
                      height: 35,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFF282828),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Iqrom Abadi',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      )
    ],
  );
}

_Body(context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 40),
            child: Column(
              children: [
                buildCustomButton(
                  Icons.manage_accounts_outlined,
                  'Account',
                  () {},
                ),
                buildCustomButton(
                  Icons.account_circle_outlined,
                  'Edit Profile',
                  () {},
                ),
                buildCustomButton(
                  Icons.circle_notifications_outlined,
                  'Notification',
                  () {},
                ),
                buildCustomButton(
                  Icons.settings,
                  'Settings',
                  () {},
                ),
                buildCustomButton(
                  Icons.error_outline,
                  'About Us',
                  () {},
                ),
                buildCustomButton(
                  Icons.contact_support_outlined,
                  'Help',
                  () {},
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
