import 'package:flutter/material.dart';
import 'package:flutterproj/models/newapi.dart';
import 'package:flutterproj/views/widgets/news_card.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(100, 50, 100, 50),
          child: Column(
            children: [
              const SizedBox(
                height: 110,
                width: 110,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile-img.png'),
                ),
              ),
              const Divider(
                height: 30.0,
              ),
              const Text(
                'NAME',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      backgroundColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  child: const Text("Gauri Malpani"),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'PHONE',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      backgroundColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  child: const Text("7498472344"),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'EMAIL',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      backgroundColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  child: const Text("malpanigauri@gmail.com"),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'ADDRESS',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      backgroundColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  child: const Text("Mumbai"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
