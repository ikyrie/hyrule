import 'package:flutter/material.dart';
import 'package:hyrule/presenter/screens/home.dart';

void main() {
  runApp(const Hyrule());
}

class Hyrule extends StatelessWidget {
  const Hyrule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      title: "Hyrule",
      home: Home(),
    );
  }
}
