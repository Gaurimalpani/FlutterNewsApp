import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutterproj/views/homeScreen.dart';
import 'package:flutterproj/views/profileScreen.dart';
import 'package:flutterproj/views/crudScreen.dart';
import 'package:flutterproj/screens/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that Flutter is initialized
  await Firebase.initializeApp(); // Initialize Firebase app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily News',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: SignInScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePageScreen(),
    crudScreen(),
    ProfilePageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.newspaper),
            SizedBox(width: 10),
            Text('Daily News'),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.newspaper),
            title: Text('News'),
            activeColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            activeColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            'Home Screen',
            textStyle: TextStyle(fontSize: 24.0),
            speed: Duration(milliseconds: 200),
          ),
        ],
        isRepeatingAnimation: false,
      ),
    );
  }
}

// class YourRecipesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AnimatedTextKit(
//         animatedTexts: [
//           TypewriterAnimatedText(
//             'Your Recipes Screen',
//             textStyle: TextStyle(fontSize: 24.0),
//             speed: Duration(milliseconds: 200),
//           ),
//         ],
//         isRepeatingAnimation: false,
//       ),
//     );
//   }
// }

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AnimatedTextKit(
//         animatedTexts: [
//           TypewriterAnimatedText(
//             'Profile Screen',
//             textStyle: TextStyle(fontSize: 24.0),
//             speed: Duration(milliseconds: 200),
//           ),
//         ],
//         isRepeatingAnimation: false,
//       ),
//     );
//   }
// }
