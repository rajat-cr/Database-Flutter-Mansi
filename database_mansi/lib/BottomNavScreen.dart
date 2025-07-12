import 'package:database_mansi/HomeScreen.dart';
import 'package:database_mansi/SettingScreen.dart';
import 'package:flutter/material.dart';

class Bottomnavscreen extends StatefulWidget {
  const Bottomnavscreen({super.key});

  @override
  State<Bottomnavscreen> createState() => _BottomnavscreenState();
}

class _BottomnavscreenState extends State<Bottomnavscreen> {
  int selected = 0;

  var list = [Homescreen(), Settingscreen()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("Check Value: $selected");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Nav Screen"),
        backgroundColor: Colors.redAccent,
      ),
      body: list[selected],

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: "Profile",
          ),
        ],

        onTap: (value) {
          selected = value;
          setState(() {});
        },
      ),
    );
  }
}
