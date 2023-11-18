import 'package:flutter/material.dart';

import '../../domain/models/entry.dart';

class EntryCard extends StatelessWidget {
  const EntryCard({super.key, required this.entry});

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Ink(
              child: Row(
                children: [
                  Image.network(
                    entry.image,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(entry.name),
                      Text(entry.description),
                    ],
                  )
                ],
              ),
            ),
          ),
          Wrap(
            children: entry
                .commonLocationConverter()
                .map(
                  (e) => Chip(
                    label: Text(e),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
