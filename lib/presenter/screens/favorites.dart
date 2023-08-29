import 'package:flutter/material.dart';

import '../../utils/consts/examples.dart';
import '../components/entry_card.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Itens Salvos"),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return EntryCard(
                    entry: entryExample,
                    isSaved: true,
                  );
                },
                childCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
