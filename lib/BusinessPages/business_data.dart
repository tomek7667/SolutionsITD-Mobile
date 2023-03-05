class BusinessData {
  String name;
  final String routeName;
  final String? logoPath;
  final bool isDeveloped;
  final bool isSponsored;

  late List<String> keywords;

  BusinessData({
    required this.name,
    required this.routeName,
    this.isDeveloped = false,
    this.isSponsored = false,
    this.logoPath,
    this.keywords = const [],
  });
}
