import 'package:flutter/material.dart';
import 'package:property_management_system/feature/constant/colors.dart';

class defaultFormField extends StatelessWidget {
  final double width, height;
  final IconData prefix;
  final TextEditingController controller;
  final String hintText;
  final Function onTap;
  final Function? onSubmit;
  final TextInputType? keyboard;
  final IconData? suffix;
  final Function? suffixPressed;
  bool? isPassword = false;
  final Function validator;

  defaultFormField(
      {required this.height,
      required this.width,
      required this.hintText,
      required this.onTap,
      required this.validator,
      required this.controller,
      required this.prefix,
      this.suffixPressed,
      this.suffix,
      this.keyboard,
      this.isPassword,
      this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        child: TextFormField(
          onFieldSubmitted: (val) {
            if (onSubmit != null) {
              onSubmit!(val);
            }
          },
          cursorColor: teal1,
          controller: controller,
          keyboardType: keyboard ?? TextInputType.text,
          obscureText: isPassword ?? false,
          onTap: () {
            return onTap();
          },
          validator: (value) {
            return validator(value);
          },
          decoration: InputDecoration(
            labelText: hintText,
            prefixIcon: Icon(
              prefix,
              color: teal,
            ),
            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: () {
                      return suffixPressed!();
                    },
                    icon: Icon(
                      suffix,
                      color: teal,
                    ),
                  )
                : Container(
                    width: 10.0,
                  ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: teal, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: teal, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: teal, width: 2.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: teal, width: 2.0),
            ),
          ),
        ));
  }
}