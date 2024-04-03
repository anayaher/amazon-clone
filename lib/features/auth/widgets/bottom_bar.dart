import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/accounts/screens/account_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text("Cart Page"),
    )
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  double bottomNavWidth = 42;
  double bottomBarBorderWidth = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => updatePage(value),
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        iconSize: 28,
        items: [
          //HOME
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              width: bottomNavWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: bottomBarBorderWidth,
                      color: _page == 0
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor),
                ),
              ),
              child: Icon(Icons.home_outlined),
            ),
          ),

          //ACCOUNT
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              width: bottomNavWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: bottomBarBorderWidth,
                      color: _page == 1
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor),
                ),
              ),
              child: const Icon(Icons.person_outline_outlined),
            ),
          ),
          //CART
          BottomNavigationBarItem(
            label: "",
            icon: Container(
                width: bottomNavWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: bottomBarBorderWidth,
                        color: _page == 2
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor),
                  ),
                ),
                child: Badge.count(
                  textColor: Colors.black,
                  count: 2,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.shopping_cart_outlined),
                )),
          )
        ],
      ),
    );
  }
}
