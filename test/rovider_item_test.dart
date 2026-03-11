import 'package:flutter_test/flutter_test.dart';
import 'package:find_thing/providers/provider.dart';

void main() {
  group('ProviderItem', () {
    test('Вернуть список локаций', () {
      final providerItem = ProviderItem();
      expect(providerItem.location, ['Все', 'Коробка 1', 'Коробка 2', 'Коробка 3']);
      expect(providerItem.indexLocation, 0);
    }
    );
    test('Изменение индекса локации', () {
      final providerItem = ProviderItem();
      providerItem.setIndexLocation(1);
      expect(providerItem.indexLocation, 1);
      providerItem.setIndexLocation(2);
      expect(providerItem.indexLocation, 2);
      providerItem.setIndexLocation(3);
      expect(providerItem.indexLocation, 3);
    });
    test('Добавление новой локации', () {
      final providerItem = ProviderItem();
      providerItem.addLocation('Коробка 4');
      expect(providerItem.location, ['Все', 'Коробка 1', 'Коробка 2', 'Коробка 3', 'Коробка 4']);
      expect(providerItem.indexLocation, 4);
    });
    test('Удаление локации', () {
      final providerItem = ProviderItem();
      providerItem.deleteLocation('Коробка 1');
      expect(providerItem.location, ['Все', 'Коробка 2', 'Коробка 3']);
      expect(providerItem.indexLocation, 2);
    });

  });

}
