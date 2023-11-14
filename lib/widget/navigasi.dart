import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navigasi extends StatelessWidget {
  final String Gambar;
  final String Title;
  final Widget Menu;

  const Navigasi({
    required this.Gambar,
    required this.Title,
    required this.Menu,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Menu,
              ),
            );
          },
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(Gambar),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                Title,
                style: GoogleFonts.nunitoSans(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
