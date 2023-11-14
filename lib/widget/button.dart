import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildCustomButton(IconData icon, String text, VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Color(0xFF282828),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        minimumSize: Size(double.infinity, 60),
        elevation: 0,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Spacer(),
          Icon(
            Icons.chevron_right,
            size: 20,
            color: Color(0xFF282828),
          ),
        ],
      ),
    ),
  );
}
