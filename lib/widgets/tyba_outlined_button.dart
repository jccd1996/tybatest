import 'package:flutter/material.dart';
import 'package:tybatest/assets/tyba_colors.dart';

class TybaOutlinedButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;

  TybaOutlinedButton({
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: TybaColors.MAIN_GREEN),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
