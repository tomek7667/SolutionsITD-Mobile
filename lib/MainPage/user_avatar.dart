import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final Uri? pictureUrl;

  const UserAvatar({
    required this.pictureUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (pictureUrl != null) {
      return Container(
        margin: const EdgeInsets.all(12),
        child: CircleAvatar(
          radius: 25,
          child: ClipOval(
            child: Image.network(
              pictureUrl.toString(),
            ),
          ),
        ),
      );
    } else {
      return const SizedBox(
        width: 25 + 12 * 2,
      );
    }
  }
}
