import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tap_models/tap_model.dart';
import 'package:tap_repository/tap_repository.dart';

class CreateTap extends StatelessWidget {
  TextEditingController teTitle = TextEditingController();
  TextEditingController teDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 15,
            right: 15,
          ),
          child: TextField(
            controller: teTitle,
            decoration: const InputDecoration(
              hintText: 'Task Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 15,
            right: 15,
          ),
          child: TextField(
            controller: teDescription,
            decoration: const InputDecoration(
              hintText: 'Task Descriptions',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          margin: const EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () {
              final tap = TapModel(
                id: 10,
                title: teTitle.text,
                description: teDescription.text,
              );
              TapRepository().addTap(tap);
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        )
      ]),
    );
  }
}
