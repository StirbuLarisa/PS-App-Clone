import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ps_clone/components/slide-down.dart';
import 'components/game_card.dart';
import 'components/account.dart';
import 'components/nav-menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'PS App Clone',
      home: MyHomePage(title: 'PS App Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return
     const SafeArea(
      child:  Scaffold(
      backgroundColor: Color(0xFF131416),
      body:
           Stack(
            children: [
              SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 95.0)),
                  Account(imageUrl: "assets/account.jpeg", name: "Larisa Stirbu"),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Recently Played",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                  GameCard(imageUrl: "assets/gta5.jpg", gameName: "GTA 5", hoursPlayed: "37 h", trophies: {"plat": 0,"gold": 5, "silver": 3, "bronze": 2}),
                  GameCard(imageUrl: "assets/beatsaber.jpg", gameName: "Beat Saber", hoursPlayed: "20 h", trophies: {"plat": 0,"gold": 3, "silver": 5, "bronze": 2}),
                 GameCard(imageUrl: "assets/sanadreas.jpg", gameName: "Grand Theft Auto: San Andreas", hoursPlayed: "105 h", trophies: {"plat": 1,"gold": 5, "silver": 8, "bronze": 21}),
                  GameCard(imageUrl: "assets/sanadreas.jpg", gameName: "Grand Theft Auto: San Andreas", hoursPlayed: "105 h", trophies: {"plat": 1,"gold": 5, "silver": 8, "bronze": 21}),
                  GameCard(imageUrl: "assets/sanadreas.jpg", gameName: "Grand Theft Auto: San Andreas", hoursPlayed: "105 h", trophies: {"plat": 1,"gold": 5, "silver": 8, "bronze": 21}),

                ],
              ),
            ),
               Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: NavMenu(),
              ),

              SlideDown(),
            ],

          ),

    ),
    );
  }
}
