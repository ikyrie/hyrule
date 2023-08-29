import 'package:flutter/material.dart';
import 'package:hyrule/presenter/screens/results.dart';


void main() {
  runApp(const Hyrule());
}

class Hyrule extends StatelessWidget {
  const Hyrule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      title: "Hyrule",
      home: const Results(),
    );
  }
}
