import 'package:flutter/material.dart';
import 'package:solutions_itd_mobile/BusinessPages/business_data.dart';
import 'package:solutions_itd_mobile/BusinessPages/develop_icon.dart';
import 'package:solutions_itd_mobile/BusinessPages/sponsor_icon.dart';
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
                      // color: AppColors.turquoise,
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
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (widget.isDeveloped) const DevelopIcon(),
            if (widget.isSponsored)
              SponsorIcon(
                isDeveloped: widget.isDeveloped,
              ),
          ],
        ),
      ),
    );
  }
}
