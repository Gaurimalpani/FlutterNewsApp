import 'package:flutter/material.dart';
import 'package:flutterproj/models/recipe.api.dart';
import 'package:flutterproj/views/widgets/recipe_card.dart';

import 'models/recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(
              title: _recipes[index].name,
              cookTime: _recipes[index].totalTime,
              rating: _recipes[index].rating.toString(),
              thumbnailUrl: _recipes[index].images);
        },
      )
    );
  }
}

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Info Data"),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(100,50,100,50),
          child: Column(
            children: [
              SizedBox(
                height: 110,
                width: 110,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile-img.png'),
                ),
              ),
              Divider(
                height: 30.0,
              ),
              Text(
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
                      padding: EdgeInsets.all(10.0),
                      backgroundColor:Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )

                  ), child: const Text("Sanika Surve"),
                ),
              ),
              SizedBox(height: 15),
              Text(
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
                      padding: EdgeInsets.all(10.0),
                      backgroundColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )

                  ), child: const Text("1234567890"),
                ),
              ),
              SizedBox(height: 15),
              Text(
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
                      padding: EdgeInsets.all(10.0),
                      backgroundColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )

                  ), child: const Text("abc@gmail.com"),
                ),
              ),
              SizedBox(height: 15),
              Text(
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
                      padding: EdgeInsets.all(10.0),
                      backgroundColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )

                  ), child: const Text("Mumbai"),
                ),
              ),
            ],
          ),
        ),



      ),
    );
  }
}
