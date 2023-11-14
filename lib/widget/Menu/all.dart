import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllMenu extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  AllMenu({
    required this.screenWidth,
    required this.screenHeight,
  });

  final List<Map<String, String>> products = [
    {
      'Gambar': 'assets/burger1.jpg',
      'Nama': 'Burger 1',
      'Harga': 'Rp. 50.000',
    },
    {
      'Gambar': 'assets/pizza1.jpg',
      'Nama': 'Pizza',
      'Harga': 'Rp. 60.000',
    },
    {
      'Gambar': 'assets/dessert (1).jpg',
      'Nama': 'Dessert 1',
      'Harga': 'Rp. 60.000',
    },
    {
      'Gambar': 'assets/burger (1).jpg',
      'Nama': 'Burger 1',
      'Harga': 'Rp. 60.000',
    },
    {
      'Gambar': 'assets/burger (2).jpg',
      'Nama': 'Burger 2',
      'Harga': 'Rp. 60.000',
    },
    {
      'Gambar': 'assets/pizza (2).jpg',
      'Nama': 'Pizza 2',
      'Harga': 'Rp. 60.000',
    },
    {
      'Gambar': 'assets/dessert (6).jpg',
      'Nama': 'Dessert 6',
      'Harga': 'Rp. 60.000',
    },
    {
      'Gambar': 'assets/pizza (1).jpg',
      'Nama': 'Pizza 1',
      'Harga': 'Rp. 60.000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: screenWidth / (screenHeight * 0.50),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      itemBuilder: (context, index) {
        var product = products[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      product['Gambar']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product['Nama']!,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.green[900],
                            ),
                          ),
                          Icon(
                            Icons.favorite_border_outlined,
                            size: 24,
                            color: Colors.red.shade900,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product['Harga']!,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.add_shopping_cart_rounded,
                            size: 24,
                            color: Colors.amber[800],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
