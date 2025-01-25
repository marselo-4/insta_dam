import 'package:flutter/material.dart';
import 'package:insta_dam/controller/last_session_controller.dart';
import 'package:insta_dam/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  final int initialIndex;

  HomeScreen(this.initialIndex, {super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int selectedIndex;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(selectedIndex);
    });
  }

  void _onItemTapped(int indexParam) {
    setState(() {
      selectedIndex = indexParam;
    });
    if (indexParam == 0) {
      lastSessionController('/home');
    } else if (indexParam == 1) {
      lastSessionController('/post');
    } else if (indexParam == 2) {
      lastSessionController('/profile');
    } else if (indexParam == 3) {
      lastSessionController('/settings');
    }
    _pageController.jumpToPage(indexParam);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/img/instadam.webp',
          height: 30,
        ),
        automaticallyImplyLeading: false,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(), // Disable horizontal scrolling
        children: const [
          FeedScreen(),
          PostScreen(),
          ProfileScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo_rounded),
            label: 'Publicar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black87,
        selectedItemColor: Colors.black,
        showUnselectedLabels: false,
        unselectedLabelStyle: const TextStyle(fontSize: 0),
      ),
    );
  }
}