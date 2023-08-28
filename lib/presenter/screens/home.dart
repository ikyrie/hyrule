import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/data/api/data_api.dart';
import 'package:hyrule/domain/models/entry.dart';

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
              final Entry entry = Entry(id: 1, name: "james", image: "james", description: "james", category: "james", dlc: true);
              final DaoController daoController = DaoController();
              List<Entry> entries = await daoController.getSavedEntries();
              print(entries[0].toMap());
            },
            child: Text("Save"),
          ),
        ),
      ),
    );
  }
}
