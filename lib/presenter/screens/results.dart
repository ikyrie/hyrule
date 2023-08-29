import 'package:flutter/material.dart';

import '../../utils/consts/examples.dart';
import '../components/entry_card.dart';
import 'favorites.dart';

class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Creatures"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Favorites(),
                  ),
                );
              },
              icon: const Icon(Icons.bookmark),
            )
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return EntryCard(
                    entry: entryExample,
                  );
                },
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
