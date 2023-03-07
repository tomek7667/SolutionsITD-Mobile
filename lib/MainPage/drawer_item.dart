import 'package:flutter/material.dart';

class DrawerButton extends StatefulWidget {
  final Function onPressed;
  final IconData iconData;
  final String text;

  const DrawerButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    required this.text,
  });

  @override
  State<DrawerButton> createState() => _DrawerButtonState();
}

class _DrawerButtonState extends State<DrawerButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {widget.onPressed()},
      child: SizedBox(
        height: 64,
        child: Row(
          children: [
            const Spacer(),
            Icon(widget.iconData),
            Text(
              widget.text,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
