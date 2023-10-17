import 'package:flutter/material.dart';
import 'package:herbal_plants/screens/tabs/camera_tab.dart';
import 'package:herbal_plants/screens/tabs/home_tab.dart';
import 'package:herbal_plants/screens/tabs/info_tab.dart';
import 'package:herbal_plants/screens/tabs/plant_tab.dart';
import 'package:herbal_plants/widgets/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> children = [
    const HomeTab(),
    const PlantTab(),
    const CameraTab(),
    const InfoTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'HERBAL PLANTS',
          fontSize: 18,
          fontFamily: 'Bold',
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontFamily: 'QBold'),
        unselectedLabelStyle: const TextStyle(fontFamily: 'QBold'),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: onTabTapped,
        currentIndex: currentIndex,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication_liquid_rounded),
            label: 'Plants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Guide',
          ),
        ],
      ),
    );
  }
}
