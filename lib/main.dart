import 'package:flutter/material.dart';
import 'package:flutterproj/sample.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title : "app",
    home: BottomMenu(),
  ));
}

class BottomMenu extends StatefulWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  State<BottomMenu> createState(){
    return  _BottomMenuState();
  }
}

class _BottomMenuState extends State<BottomMenu> {
  var _pagesData = [HomePage(), InfoPage(), ProfilePage()];
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Recipe App"),
          backgroundColor: Colors.black,
      ),
      body: Center(
        child: _pagesData[_selectedItem],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        currentIndex: _selectedItem,
        onTap: (setValue){
          setState(() {
            _selectedItem = setValue;
          });
        },
      ),
    );
  }
}
