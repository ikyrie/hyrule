import 'package:flutter/material.dart';
import 'package:hyrule/data/api/data_api.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Escolha uma categoria:"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final DataApi dataApi = DataApi();
              dataApi.getEntriesByCategory(category: "creatures");
            },
            child: Text("Make request"),
          ),
        ),
      ),
    );
  }
}
