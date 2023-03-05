// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile/BusinessPages/business_tile.dart';
import 'package:mobile/BusinessPages/businesses.dart';
import 'package:mobile/MainPage/main_page_filter_provider.dart';
import 'package:provider/provider.dart';

class MainGrid extends StatefulWidget {
  const MainGrid({super.key});

  @override
  State<MainGrid> createState() => _MainGridState();
}

class _MainGridState extends State<MainGrid> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageFilterProvider>(
      builder: (context, mainPageFilterProvider, child) {
        return GridView.count(
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          crossAxisCount: 3,
          childAspectRatio: 5 / 6,
          padding: const EdgeInsets.all(24),
          scrollDirection: Axis.vertical,
          children: companies
              .where((businessData) {
                var filterText = mainPageFilterProvider.filter;
                var appNameFiltered = businessData.name.contains(filterText);
                var keywordsFiltered = businessData.keywords.any((keyword) {
                  return keyword.contains(filterText);
                });
                if (filterText.isNotEmpty) {
                  return appNameFiltered || keywordsFiltered;
                }
                return true;
              })
              .map(BusinessTile.create)
              .toList(),
        );
      },
    );
  }
}