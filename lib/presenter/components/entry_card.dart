import 'package:flutter/material.dart';

import '../../controllers/dao_controller.dart';
import '../../domain/models/entry.dart';
import '../../theme.dart';
import '../screens/details.dart';

class EntryCard extends StatelessWidget {
  EntryCard({super.key, required this.entry, this.isSaved = false});
  final Entry entry;
  final bool isSaved;
  final DaoController daoController = DaoController();

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
          daoController.removeEntry(entry: entry);
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Deletado')));
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
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(entry.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(entry.name.toUpperCase(), style: EntryDecoration.titleText,),
                              ),
                              Flexible(
                                child: Text(
                                  entry.description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    child: Wrap(
                      spacing: 8.0,
                      children: entry
                          .commonLocationsConverter()
                          .map(
                            (e) => Chip(
                                label: Text(e),
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer),
                          )
                          .toList(),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
