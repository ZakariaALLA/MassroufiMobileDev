import 'package:flutter/material.dart';

class MyDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xfffbb448),
              Colors.white
            ],
          ),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
            ]
        ),
      );
  }
}
