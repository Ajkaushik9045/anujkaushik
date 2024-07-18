import 'package:anujkaushik/components/constants/color.dart';
import 'package:anujkaushik/components/constants/strings.dart';
import 'package:anujkaushik/pages/homeScreen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    // const SavedPage(),
    // const SearchPage(),
    // const AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryColor,
        selectedItemColor: AppColors.secondaryColor,
        unselectedItemColor: AppColors.secondaryColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(
          decoration: TextDecoration.underline,
          decorationColor: Colors.white,
          decorationThickness: 2.0,
          height: 1.5,
        ),
        unselectedLabelStyle: const TextStyle(
          decoration: TextDecoration.none,
          decorationColor: Colors.white,
          decorationThickness: 2.0,
          height: 1.5,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppText.homeText,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: AppText.savedText,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: AppText.searchText,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppText.accounttext,
          ),
        ],
      ),
    );
  }
}
