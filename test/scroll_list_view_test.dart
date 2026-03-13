import 'package:flutter/material.dart';
import 'package:find_thing/screens/main_page.dart';
import 'package:find_thing/providers/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _buildTestWidget() {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => ProviderItem(),
        child: const Scaffold(body: ScrollListView()),
      ),
    );
  }

  testWidgets('Проверка отображения списка локаций, при загрузке приложения', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(_buildTestWidget());
    await tester.pumpAndSettle();
  });
  expect(
    find. byWidgetPredicate(
      (w) => w is TextField && w.decoration?.hintText == 'Название вещи или коробки...',
    ),
    findsOneWidget,
  );
  expect(find.byType(ScrollListView), findsOneWidget);
}

