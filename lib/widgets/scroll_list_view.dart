import 'package:flutter/material.dart';
import 'package:find_thing/design/dimensions.dart';
import 'package:find_thing/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:find_thing/providers/provider.dart';

class ScrollListView extends StatelessWidget {
  const ScrollListView({super.key});

  @override
  Widget build(BuildContext context) {
    final providerFilter = Provider.of<ProviderItem>(context);
    final AppSpacingTheme spacing = context.appSpacing;

    return SizedBox(
      height: chipListHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: spacing.chipListHorizontalPadding,
          vertical: spacing.chipListVerticalPadding,
        ),
        itemCount: providerFilter.location.length,
        itemBuilder: (context, index) {
          final String name = providerFilter.location[index];
          final bool isSelected = providerFilter.indexLocation == index;
          return Padding(
            padding: EdgeInsets.only(right: spacing.chipItemSpacing),
            child: Transform.translate(
              offset: Offset(0, isSelected ? -2.5 : 0),
              child: GestureDetector(
                onTap: () => providerFilter.setIndexLocation(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 280),
                  curve: Curves.easeOutCubic,
                  padding: EdgeInsets.symmetric(
                    horizontal: spacing.chipHorizontalPadding,
                    vertical: spacing.chipVerticalPadding,
                  ),
                  decoration: context.appDecoration
                      .scrollListChipDecoration(isSelected: isSelected),
                  child: Text(
                    name,
                    style: AppTheme.bodyChip(context, isSelected: isSelected),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
