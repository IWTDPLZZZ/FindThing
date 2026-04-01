import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:find_thing/BLoC/photo_item_bloc.dart';
import 'package:find_thing/models/storage_item_main_page.dart';
import 'package:find_thing/providers/provider.dart';
import 'package:find_thing/services/ai_service.dart';
import 'package:find_thing/theme/app_theme.dart';
import 'package:find_thing/widgets/custom_appbar.dart';
import 'package:find_thing/widgets/main_bottom_navigation_bar.dart'
    show MainBottomAppBar, MainCameraFab;
import 'package:find_thing/widgets/item_card.dart';
import 'package:find_thing/widgets/main_home_tab_content.dart';
import 'package:find_thing/widgets/profile_tab_content.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  late final List<Widget> _tabBodies = <Widget>[
    const MainHomeTabContent(),
    _PlaceholderTab(
      title: 'Поиск',
      message: 'Расширенный поиск скоро появится здесь.',
    ),
    const _StorageTab(),
    const ProfileTabContent(),
  ];

  void _onNavItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  void _showSourcePicker(BuildContext context) {
    final bloc = context.read<PhotoItemBloc>();
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text('Камера'),
                onTap: () {
                  Navigator.pop(context);
                  bloc.add(const PhotoItemPickImage(ImageSource.camera));
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text('Галерея'),
                onTap: () {
                  Navigator.pop(context);
                  bloc.add(const PhotoItemPickImage(ImageSource.gallery));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// After detection — ask user where the item is stored.
  /// Default place = currently selected location chip.
  Future<void> _showPlaceDialog(
    BuildContext context, {
    required String detectedName,
    required String imagePath,
  }) async {
    final bloc = context.read<PhotoItemBloc>();
    final itemsProvider = context.read<ItemsAddProvider>();

    final nameController = TextEditingController(text: detectedName);
    final placeController = TextEditingController();

    final result = await showDialog<({String name, String place})>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Что нашли?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Название предмета',
                hintText: 'Например: Ноутбук',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: placeController,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Место хранения',
                hintText: 'Например: Коробка 1',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              bloc.add(const PhotoItemReset());
            },
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () {
              final name = nameController.text.trim();
              final place = placeController.text.trim();
              Navigator.pop(ctx, (
                name: name.isEmpty ? detectedName : name,
                place: place.isEmpty ? 'Не указано' : place,
              ));
            },
            child: const Text('Добавить'),
          ),
        ],
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      nameController.dispose();
      placeController.dispose();
    });

    if (result == null) return;

    itemsProvider.addItems(
      StorageItemMainPage(
        name: result.name,
        place: result.place,
        pathImage: imagePath,
      ),
    );
    bloc.add(
      PhotoItemConfirmItem(
        name: result.name,
        place: result.place,
        imagePath: imagePath,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PhotoItemBloc(
        picker: ImagePicker(),
        ai: AiService(),
      ),
      child: Builder(
        builder: (ctx) => BlocListener<PhotoItemBloc, PhotoItemState>(
          listener: (context, state) {
            if (state is PhotoItemDetected) {
              _showPlaceDialog(
                context,
                detectedName: state.name,
                imagePath: state.imagePath,
              );
            } else if (state is PhotoItemFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text(state.message),
                  behavior: SnackBarBehavior.floating,
                ));
            } else if (state is PhotoItemAdded) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(const SnackBar(
                  content: Text('Вещь добавлена!'),
                  behavior: SnackBarBehavior.floating,
                ));
            }
          },
          child: BlocBuilder<PhotoItemBloc, PhotoItemState>(
            buildWhen: (prev, curr) =>
                (prev is PhotoItemLoading) != (curr is PhotoItemLoading),
            builder: (context, state) => Stack(
              children: [
                Scaffold(
                  extendBody: true,
                  appBar: const CustomBarForMainPage(),
                  floatingActionButton: MainCameraFab(
                    onTap: () => _showSourcePicker(context),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  bottomNavigationBar: MainBottomAppBar(
                    currentIndex: _currentIndex,
                    onItemSelected: _onNavItemTapped,
                  ),
                  body: IndexedStack(
                    index: _currentIndex,
                    children: _tabBodies,
                  ),
                ),
                if (state is PhotoItemLoading) _LoadingOverlay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black38,
      child: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(
                  'Распознаём предмет…',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaceholderTab extends StatelessWidget {
  final String title;
  final String message;

  const _PlaceholderTab({
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final AppSpacingTheme spacing = context.appSpacing;
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing.gapXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: spacing.gapM),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StorageTab extends StatelessWidget {
  const _StorageTab();

  @override
  Widget build(BuildContext context) {
    final AppSpacingTheme spacing = context.appSpacing;
    final double bottomInset =
        MediaQuery.paddingOf(context).bottom +
            spacing.bottomNavBarHeight +
            spacing.bottomNavFabSize * 0.45 +
            8;

    return Consumer<ItemsAddProvider>(
      builder: (context, provider, _) {
        final items = provider.items;

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
                    'Хранилище пусто.\nДобавьте вещь через камеру.',
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
              padding: EdgeInsets.fromLTRB(
                spacing.screenHorizontalPadding,
                spacing.gapL,
                spacing.screenHorizontalPadding,
                spacing.gapS,
              ),
              child: Text(
                'Все вещи (${items.length})',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: bottomInset + spacing.gapM),
                itemCount: items.length,
                itemBuilder: (context, index) => ItemCard(item: items[index]),
              ),
            ),
          ],
        );
      },
    );
  }
}
