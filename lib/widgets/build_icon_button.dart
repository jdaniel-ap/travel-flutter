import 'package:flutter/material.dart';

class BuildIconButton extends StatelessWidget {
  final int index;
  final IconData icon;
  final int selectedIndex;
  final void Function(int) setIndex;

  const BuildIconButton(
      {Key? key,
      required this.index,
      required this.icon,
      required this.selectedIndex,
      required this.setIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setIndex(index);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: index == selectedIndex
                ? Theme.of(context).colorScheme.secondary
                : const Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          icon,
          color: index == selectedIndex
              ? Theme.of(context).colorScheme.primary
              : const Color(0xFFB4C1C4),
        ),
      ),
    );
  }
}
