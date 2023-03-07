import 'package:flutter/material.dart';
import 'package:solutions_itd_mobile/BusinessPages/business_data.dart';
import 'package:solutions_itd_mobile/utils/app_colors.dart';

class BusinessTile extends StatefulWidget {
  static BusinessTile create(BusinessData businessData) {
    return BusinessTile(
      name: businessData.name,
      routeName: businessData.routeName,
      logoPath: businessData.logoPath,
      isDeveloped: businessData.isDeveloped,
      isSponsored: businessData.isSponsored,
      keywords: businessData.keywords,
    );
  }

  final String name;
  final String routeName;
  final String? logoPath;
  final bool isDeveloped;
  final bool isSponsored;

  late Set<String> keywords;

  BusinessTile({
    super.key,
    required this.name,
    required this.routeName,
    this.isDeveloped = false,
    this.isSponsored = false,
    this.logoPath,
    List<String> keywords = const [],
  }) {
    this.keywords = Set.from(keywords);
    this.keywords.add(name.toLowerCase());
  }

  @override
  State<BusinessTile> createState() => _BusinessTileState();
}

class _BusinessTileState extends State<BusinessTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(
            context,
            widget.routeName,
          );
        },
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.turquoise,
                      image: widget.logoPath != null
                          ? DecorationImage(
                              image: AssetImage(widget.logoPath as String),
                              fit: BoxFit.cover,
                            )
                          : null,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Container(),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (widget.isDeveloped)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.build,
                      color: AppColors.turquoise,
                      size: 16.0,
                    ),
                  ),
                ),
              ),
            if (widget.isSponsored)
              Positioned(
                top: 8,
                right: 8 + (widget.isDeveloped ? 28 : 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.star,
                      color: AppColors.turquoise,
                      size: 16.0,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
