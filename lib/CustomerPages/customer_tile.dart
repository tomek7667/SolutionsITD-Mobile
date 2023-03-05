import 'package:flutter/material.dart';
import 'package:mobile/utils/app_colors.dart';

class CustomerTile extends StatefulWidget {
  final String name;
  final String routeName;

  const CustomerTile({
    super.key,
    required this.name,
    required this.routeName,
  });

  @override
  State<CustomerTile> createState() => _CustomerTileState();
}

class _CustomerTileState extends State<CustomerTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(
            context,
            widget.routeName,
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            AppColors.turquoise,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
        ),
        child: Text(widget.name),
      ),
    );
  }
}
