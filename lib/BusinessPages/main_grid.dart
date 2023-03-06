// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:solutions_itd_mobile/BusinessPages/business_tile.dart';
import 'package:solutions_itd_mobile/BusinessPages/businesses.dart';
import 'package:solutions_itd_mobile/MainPage/main_page_filter_provider.dart';
import 'package:provider/provider.dart';

class MainGrid extends StatefulWidget {
  const MainGrid({super.key});

  @override
  State<MainGrid> createState() => _MainGridState();
}

class _MainGridState extends State<MainGrid> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageProvider>(
      builder: (context, mainPageProvider, child) {
        var count = ((MediaQuery.of(context).size.width) / 128).round() - 1;
        count = count > 0 ? count : 1;
        return GridView.count(
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          crossAxisCount: count,
          childAspectRatio: 5 / 6,
          padding: const EdgeInsets.all(24),
          scrollDirection: Axis.vertical,
          children: companies
              .where((businessData) {
                var filterText = mainPageProvider.data.filter;
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
