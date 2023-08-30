import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';

import '../../utils/consts/examples.dart';
import '../components/entry_card.dart';

class Favorites extends StatelessWidget {
  Favorites({super.key});
  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Itens Salvos"),
        ),
        body: FutureBuilder(
          future: daoController.getSavedEntries(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) =>
                        EntryCard(entry: snapshot.data![index], isSaved: true),
                    itemCount: snapshot.data!.length,
                  );
                }
              default:
            }
            return Container();
          },
        ),
      ),
    );
  }
}
