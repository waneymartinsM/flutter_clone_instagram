import 'package:clone_instagram/app/model/images_url.dart';
import 'package:clone_instagram/app/modules/home/store/home_store.dart';
import 'package:clone_instagram/app/modules/home/view/initial_page.dart';
import 'package:clone_instagram/app/modules/home/view/profile_page.dart';
import 'package:clone_instagram/app/modules/home/view/reels_page.dart';
import 'package:clone_instagram/app/modules/home/view/explore_page.dart';
import 'package:clone_instagram/app/modules/home/view/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeStore>();
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    InitialPage(),
    ExplorePage(),
    ReelsPage(),
    ShopPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        elevation: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: (_selectedIndex == 0) ? Colors.black : Colors.black54,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: (_selectedIndex == 1) ? Colors.black : Colors.black54,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_collection_outlined,
              color: (_selectedIndex == 2) ? Colors.black : Colors.black54,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: (_selectedIndex == 3) ? Colors.black : Colors.black54,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: NetworkImage(
                imagesUrl[0],
              ),
              radius: 15,
            ),
            label: '',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
