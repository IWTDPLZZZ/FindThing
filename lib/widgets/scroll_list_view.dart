import 'package:flutter/material.dart';
import 'package:find_thing/design/design.dart';
import 'package:provider/provider.dart';
import 'package:find_thing/providers/provider.dart';

class ScrollListView extends StatelessWidget {
  const ScrollListView({super.key});

  @override
  Widget build(BuildContext context) {
    final providerFilter = Provider.of<ProviderItem>(context);
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        itemCount: providerFilter.location.length,
        itemBuilder: (context, index) {
          final String name = providerFilter.location[index];
          final bool isSelected = providerFilter.indexLocation == index;
          return GestureDetector(
            onTap: () => providerFilter.setIndexLocation(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.only(right: 8),
              decoration: scrollListChipDecoration(isSelected: isSelected),
              child: Text(
                name,
                style: textStyleBodyChip(isSelected: isSelected),
              ),
            ),
          );
        },
      ),
    );
  }
}
