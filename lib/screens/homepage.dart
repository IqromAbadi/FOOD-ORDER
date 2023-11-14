import 'package:flutter/material.dart';
import 'package:food_order/screens/cartpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:food_order/screens/favorite.dart';
import 'package:food_order/screens/profile.dart';
import 'package:food_order/widget/Menu/all.dart';
import 'package:food_order/widget/Menu/burger.dart';
import 'package:food_order/widget/Menu/dessert.dart';
import 'package:food_order/widget/Menu/pizza.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    HomePageContent(),
    Favorite(),
    Cart(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          if (_currentPageIndex == 0)
            Container(
              height: MediaQuery.of(context).size.height * 0.23,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF282828),
                    Colors.white,
                  ],
                  stops: [0.80, 0.20],
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage('assets/Iqrom.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Iqrom Abadi',
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Selamat Datang',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.notifications_on_outlined,
                          color: Colors.white,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        cursorColor: Color(0xFF282828),
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF282828),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF282828),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF282828),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          Expanded(
            child: _pages[_currentPageIndex],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: GNav(
            color: Colors.amber[800],
            activeColor: Colors.amber[800],
            tabBackgroundColor: Color(0xFF282828),
            gap: 4,
            padding: EdgeInsets.all(10),
            selectedIndex: _currentPageIndex,
            onTabChange: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Favorite',
              ),
              GButton(
                icon: Icons.shopping_cart_rounded,
                text: 'Cart',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Container(
            height: screenHeight * 0.09,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TabBar(
                labelColor: Colors.amber[800],
                unselectedLabelColor: Color(0xFF282828),
                indicatorColor: Colors.yellow[700],
                tabs: [
                  Tab(
                    iconMargin: const EdgeInsets.all(0),
                    icon: Icon(Icons.fastfood_rounded, size: 30),
                    text: 'All',
                  ),
                  Tab(
                    iconMargin: const EdgeInsets.all(0),
                    icon: Icon(Icons.lunch_dining_rounded, size: 30),
                    text: 'Burger',
                  ),
                  Tab(
                    iconMargin: const EdgeInsets.all(0),
                    icon: Icon(Icons.local_pizza_rounded, size: 30),
                    text: 'Pizza',
                  ),
                  Tab(
                    iconMargin: const EdgeInsets.all(0),
                    icon: Icon(Icons.icecream_rounded, size: 30),
                    text: 'Dessert',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                AllMenu(screenWidth: screenWidth, screenHeight: screenHeight),
                MenuBurger(
                    screenWidth: screenWidth, screenHeight: screenHeight),
                MenuPizza(screenWidth: screenWidth, screenHeight: screenHeight),
                MenuDessert(
                    screenWidth: screenWidth, screenHeight: screenHeight),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
