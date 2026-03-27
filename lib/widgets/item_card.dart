import 'dart:io';

import 'package:flutter/material.dart';
import 'package:find_thing/design/dimensions.dart';
import 'package:find_thing/models/storage_item_main_page.dart';
import 'package:find_thing/theme/app_theme.dart';

class ItemCard extends StatelessWidget {
  final StorageItemMainPage item;

  const ItemCard({super.key, required this.item});

  Widget _imageErrorPlaceholder(BuildContext context) {
    final AppSpacingTheme spacing = context.appSpacing;
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Container(
      width: spacing.imageThumbSize,
      height: spacing.imageThumbSize,
      color: scheme.surfaceContainerHighest,
      child: Icon(
        Icons.broken_image_outlined,
        color: scheme.onSurfaceVariant,
        size: spacing.imageThumbSize * 0.4,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppSpacingTheme spacing = context.appSpacing;
    final String path = item.pathImage.trim();

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: spacing.cardHorizontalMargin,
        vertical: spacing.cardVerticalMargin,
      ),
      padding: EdgeInsets.all(spacing.cardInnerPadding),
      decoration: context.appDecoration.cardDecoration(),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(radiusItemCardImage),
            child: path.isEmpty
                ? _imageErrorPlaceholder(context)
                : Image.file(
                    File(path),
                    width: spacing.imageThumbSize,
                    height: spacing.imageThumbSize,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return _imageErrorPlaceholder(context);
                    },
                  ),
          ),
          SizedBox(width: spacing.cardHorizontalMargin),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: spacing.chipVerticalPadding),
                Text(
                  'Место: ${item.place}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
