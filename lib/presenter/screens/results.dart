import 'package:flutter/material.dart';

import '../../controllers/api_controller.dart';
import '../../utils/consts/categories_images.dart';
import '../components/entry_card.dart';
import 'favorites.dart';

class Results extends StatelessWidget {
  Results({Key? key, required this.category}) : super(key: key);
  final String category;

  final ApiController apiController = ApiController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(categories[category]!),
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
        body: FutureBuilder(
            future: apiController.getEntriesByCategory(category: category),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData){
                    return CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return EntryCard(
                                entry: snapshot.data![index],
                              );
                            },
                            childCount: snapshot.data!.length,
                          ),
                        ),
                      ],
                    );
                  }
                  break;
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator(),);
              }
              return Container();
            }),
      ),
    );
  }
}
