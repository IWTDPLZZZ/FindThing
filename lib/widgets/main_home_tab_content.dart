import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:find_thing/models/storage_item_main_page.dart';
import 'package:find_thing/providers/provider.dart';
import 'package:find_thing/theme/app_theme.dart';
import 'package:find_thing/widgets/item_card.dart';
import 'package:provider/provider.dart';

/// Main home tab: live search by item name, greeting, dynamic location tabs
/// via [DefaultTabController], and filtered item lists from [ItemsAddProvider].
class MainHomeTabContent extends StatefulWidget {
  const MainHomeTabContent({super.key});

  @override
  State<MainHomeTabContent> createState() => _MainHomeTabContentState();
}

class _MainHomeTabContentState extends State<MainHomeTabContent> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppSpacingTheme spacing = context.appSpacing;
    final User? user = FirebaseAuth.instance.currentUser;
    final String displayName = user?.displayName ?? 'пользователь';

    return Consumer<ItemsAddProvider>(
      builder: (context, provider, _) {
        final List<String> locations = provider.uniqueLocations;
        final int tabCount = locations.length + 1;
        final bool isSearching = _query.isNotEmpty;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: spacing.gapL),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: spacing.screenHorizontalPadding,
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => setState(() => _query = value.trim()),
                decoration: AppTheme.searchInputDecoration(context).copyWith(
                  suffixIcon: isSearching
                      ? IconButton(
                          icon: const Icon(Icons.close_rounded, size: 20),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _query = '');
                            FocusScope.of(context).unfocus();
                          },
                        )
                      : null,
                ),
              ),
            ),
            SizedBox(height: spacing.gapM),
            Text(
              'Привет, $displayName!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: spacing.gapM),
            if (isSearching)
              Expanded(
                child: _SearchResultsView(
                  query: _query,
                  items: provider.items,
                ),
              )
            else
              Expanded(
                child: DefaultTabController(
                  length: tabCount,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        padding: EdgeInsets.symmetric(
                          horizontal: spacing.screenHorizontalPadding,
                        ),
                        tabs: [
                          const Tab(text: 'Все'),
                          ...locations.map((loc) => Tab(text: loc)),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            _ItemListView(items: provider.items),
                            ...locations.map(
                              (loc) => _ItemListView(
                                items: provider.itemsByLocation(loc),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

/// Displays search results filtered by [query] against item names.
class _SearchResultsView extends StatelessWidget {
  final String query;
  final List<StorageItemMainPage> items;
  const _SearchResultsView({required this.query, required this.items});

  @override
  Widget build(BuildContext context) {
    final AppSpacingTheme spacing = context.appSpacing;
    final double bottomInset =
        MediaQuery.paddingOf(context).bottom +
            spacing.bottomNavBarHeight +
            spacing.bottomNavFabSize * 0.45 +
            8;

    final String lowerQuery = query.toLowerCase();
    final List<StorageItemMainPage> results = items
        .where((item) => item.name.toLowerCase().contains(lowerQuery))
        .toList();

    if (results.isEmpty) {
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
                Icons.search_off_rounded,
                size: 56,
                color: Theme.of(context)
                    .colorScheme
                    .onSurfaceVariant
                    .withValues(alpha: 0.35),
              ),
              SizedBox(height: spacing.gapM),
              Text(
                'Ничего не найдено по запросу «$query»',
                textAlign: TextAlign.center,
                style: AppTheme.emptyStateBody(context),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: spacing.screenHorizontalPadding,
            vertical: spacing.gapS,
          ),
          child: Text(
            'Найдено: ${results.length}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: bottomInset + spacing.gapM),
            itemCount: results.length,
            itemBuilder: (context, index) => ItemCard(item: results[index]),
          ),
        ),
      ],
    );
  }
}

class _ItemListView extends StatelessWidget {
  final List<StorageItemMainPage> items;
  const _ItemListView({required this.items});

  @override
  Widget build(BuildContext context) {
    final AppSpacingTheme spacing = context.appSpacing;
    final double bottomInset =
        MediaQuery.paddingOf(context).bottom +
            spacing.bottomNavBarHeight +
            spacing.bottomNavFabSize * 0.45 +
            8;

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
      itemBuilder: (context, index) => ItemCard(item: items[index]),
    );
  }
}
