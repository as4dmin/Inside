import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFD73F3F),
      width: double.infinity,
      height:250,
      padding: EdgeInsets.only(top: 20.0,bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:DecorationImage(
              image:AssetImage('assets/images/img.png'),
              ),
            ),
          ),
          Text("HITian_Inside",
            style: 
            TextStyle(
                fontSize: 20,color: Colors.white),
          ),
          Text("Somewhere Between Better And Best",
            style: TextStyle(color: Colors.grey[200],fontSize: 13),
          ),
        ],
      ),
    );
  }
}
