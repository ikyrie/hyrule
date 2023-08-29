import 'package:flutter/material.dart';

import '../../domain/models/entry.dart';
import '../screens/details.dart';

class EntryCard extends StatelessWidget {
  const EntryCard({super.key, required this.entry, this.isSaved = false});
  final Entry entry;
  final bool isSaved;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: SizedBox(
        height: 180,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Details(
                  entry: entry,
                ),
              ),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: NetworkImage(entry.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(entry.name),
                          Text(entry.description),
                        ],
                      ),
                      Wrap(
                        children: [
                          Chip(label: Text(entry.category)),
                          if (entry.dlc)
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Chip(label: Text('DLC') ),
                            ),
                          // TODO: fix delete button
                          // if (isSaved)
                          //   IconButton(
                          //     padding: EdgeInsets.zero,
                          //     onPressed: () {},
                          //     icon: const Icon(Icons.delete),
                          //   )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
