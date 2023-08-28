import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Escolha uma categoria:"),),
        body: Center(child: Text("Hello Hyrule"),),
      ),
    );
  }
}
