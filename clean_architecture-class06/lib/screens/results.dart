import 'package:flutter/material.dart';
import 'package:hyrule/controllers/api_controller.dart';
import 'package:hyrule/screens/components/entry_card.dart';
import 'package:hyrule/utils/consts/categories.dart';

import 'favorites.dart';

class Results extends StatelessWidget {
  Results({super.key, required this.category});

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Favorites()));
              },
              icon: const Icon(
                Icons.bookmark,
              ),
            )
          ],
        ),
        body: FutureBuilder(
          future: apiController.getEntriesByCategory(category: category),
          builder: (context, snaphot) {
            switch (snaphot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.none:
                break;

              case ConnectionState.done:
                if (snaphot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) => EntryCard(
                      entry: snaphot.data![index],
                      isSaved: false,
                    ),
                    itemCount: snaphot.data!.length,
                  );
                }
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
