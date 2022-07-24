import 'package:flutter/material.dart';
import 'package:tybatest/assets/tyba_colors.dart';

class TybaTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final IconData? icon;
  final bool? obscureText;
  final ValueChanged<String>? onFieldSubmitted;
  TybaTextField({
    this.controller,
    this.labelText,
    this.icon,
    this.obscureText,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: TybaColors.MAIN_GREEN,
      ),
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: icon != null
            ? Icon(
                icon,
                color: TybaColors.MAIN_GREEN,
              )
            : null,
        labelStyle: TextStyle(color: TybaColors.MAIN_GREEN),
        labelText: labelText,
        focusColor: TybaColors.MAIN_GREEN,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: TybaColors.MAIN_GREEN),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: TybaColors.MAIN_GREEN),
        ),
      ),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
