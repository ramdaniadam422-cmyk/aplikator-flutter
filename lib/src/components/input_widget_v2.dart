import 'package:flutter/material.dart';

class InputV2 extends StatefulWidget {
  final String label;
  final String hintText;
  final Widget? prefix;
  final Widget? suffix;
  final bool isPassword;
  final TextEditingController? controller;

  const InputV2({
    Key? key,
    required this.label,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.isPassword = false,
    this.controller,
  }) : super(key: key);

  @override
  InputV2State createState() => InputV2State();
}

class InputV2State extends State<InputV2> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? suffixWidget;
    if (widget.isPassword) {
      suffixWidget = InkWell(
        onTap: toggleVisibility,
        child: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey[600],
        ),
      );
    } else {
      suffixWidget = widget.suffix;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       if (widget.label.isNotEmpty) ...[
  Text(
    widget.label,
    style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Colors.grey[800],
    ),
  ),
  SizedBox(height: 8),
],

        TextField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscureText : false,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey[400]),
            prefixIcon: widget.prefix != null ? widget.prefix : null,
            prefixIconConstraints: BoxConstraints(minWidth: 40, minHeight: 40),
            suffixIcon: suffixWidget,
            suffixIconConstraints: BoxConstraints(minWidth: 40, minHeight: 40),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.blueAccent),
            ),
          ),
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}