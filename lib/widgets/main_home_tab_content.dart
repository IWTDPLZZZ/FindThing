import 'package:flutter/material.dart';
import 'package:find_thing/providers/provider.dart';
import 'package:find_thing/theme/app_theme.dart';
import 'package:find_thing/widgets/item_card.dart';
import 'package:find_thing/widgets/scroll_list_view.dart';
import 'package:provider/provider.dart';

/// Main home tab: search, location chips, and item list from [ItemsAddProvider].
class MainHomeTabContent extends StatelessWidget {
  const MainHomeTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AppSpacingTheme spacing = context.appSpacing;
    final double bottomInset =
        MediaQuery.paddingOf(context).bottom +
            spacing.bottomNavBarHeight +
            spacing.bottomNavFabSize * 0.45 +
            8;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: spacing.gapL),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing.screenHorizontalPadding),
          child: TextField(
            decoration: AppTheme.searchInputDecoration(context),
          ),
        ),
        SizedBox(height: spacing.gapM),
        Text(
          'Привет, @username!',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: spacing.gapM),
        const ScrollListView(),
        SizedBox(height: spacing.gapM),
        Expanded(
          child: Consumer<ItemsAddProvider>(
            builder: (context, itemsProvider, _) {
              final items = itemsProvider.items;
              if (items.isEmpty) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      spacing.gapL,
                      0,
                      spacing.gapL,
                      bottomInset,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 56,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurfaceVariant
                              .withValues(alpha: 0.35),
                        ),
                        SizedBox(height: spacing.gapM),
                        Text(
                          'Пока нет вещей. Добавьте первую через камеру.',
                          textAlign: TextAlign.center,
                          style: AppTheme.emptyStateBody(context),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.only(bottom: bottomInset + spacing.gapM),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemCard(item: items[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
