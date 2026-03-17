import 'dart:io';
import 'package:flutter/material.dart';
import 'package:find_thing/design/design.dart';
import 'package:find_thing/models/storage_item_main_page.dart';

class ItemCard extends StatelessWidget {
  final StorageItemMainPage item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: cardDecoration(),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              File(item.pathImage),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: textStyleBodyBold,
                ),
                const SizedBox(height: 8),
                Text(
                  'Место: ${item.place}',
                  style: textStyleBody,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
