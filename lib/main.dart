import 'package:flutter/material.dart';
import 'package:flutter_interview_test/pages/fourth_page.dart';
import 'package:flutter_interview_test/pages/home_page.dart';
import 'package:flutter_interview_test/pages/page_three.dart';
import 'package:flutter_interview_test/pages/page_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContainerPage(),
    );
  }
}

class ContainerPage extends StatefulWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = const [
      HomePage(),
      SecondPage(),
      ThirdPage(),
      FourthPage(),
    ];

    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        index = _selectedIndex;
        _pages[index];
      });
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.send,
              color: Colors.blue,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.share,
              color: Colors.blue,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            label: 'Home',
          )
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }
}
