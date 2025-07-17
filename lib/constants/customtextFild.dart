import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Customtextfild extends StatelessWidget {
  const Customtextfild({
    super.key,
    this.isIconChange = false,
    this.validator,
    this.onSaved,
    required this.lable,
    this.obscureText = false,
    required this.icon,
    this.enabled = true,
    this.controller,
    this.readonly = false,
  });
  final bool isIconChange;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String lable;
  final bool obscureText;
  final Widget icon;
  final bool enabled;
  final TextEditingController? controller;
  final bool readonly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autocorrect: false,
      decoration: InputDecoration(label: Text(lable), prefixIcon: icon),
      validator: validator,
      onSaved: onSaved,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readonly,
    );
  }
}
