import 'package:flutter/material.dart';
import 'package:hyrule/controllers/dao_controller.dart';
import 'package:hyrule/screens/components/entry_card.dart';

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
                      isSaved: true,
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
