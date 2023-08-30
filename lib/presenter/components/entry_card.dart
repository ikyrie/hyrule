import 'dart:async';
import 'dart:convert';

import 'package:floor/floor.dart';
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
      child: Dismissible(
        direction:
            isSaved ? DismissDirection.endToStart : DismissDirection.none,
        key: ValueKey<int>(entry.id),
        background: Container(
          color: Colors.redAccent,
          child: const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.delete),
            ),
          ),
        ),
        onDismissed: (direction) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('deletado')));
        },
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 180,
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
                                  Text(entry.name.toUpperCase()),
                                  Text(
                                    entry.description,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondaryContainer),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    child: Wrap(
                      spacing: 8.0,
                      children: entry.commonLocationsConverter().map((e) => Chip(label: Text(e))).toList(),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
