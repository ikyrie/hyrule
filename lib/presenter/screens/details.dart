
import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/theme.dart';

import '../../domain/models/entry.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.entry});
  final Entry entry;
  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Detalhes"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            daoController.addEntry(entry: entry);
            ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Favoritado')));
          },
          child: const Icon(Icons.bookmark),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(entry.name.toUpperCase(), style: EntryDecoration.titleText,),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Wrap(
                    spacing: 8.0,
                    children: entry.commonLocationsConverter().map((e) => Chip(label: Text(e))).toList(),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image(
                      image: NetworkImage(entry.image),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(entry.description),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
