import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/create_tap/create_tap.dart';

class HomeScreen2 extends StatefulWidget {
  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateTap(),
              ));
        },
        child: const Icon(Icons.create),
      ),
    );
  }
}
