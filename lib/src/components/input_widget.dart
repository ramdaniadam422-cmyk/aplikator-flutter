import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String label;
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;

  const InputField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    if (!widget.isPassword) {
      _obscureText = false; // tidak sembunyikan jika bukan password
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 8),
        TextField(
          obscureText: _obscureText,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.prefixIcon, color: Colors.grey[600]),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey[400]),
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.blueAccent),
            ),
            suffixIcon: widget.isPassword
                ? InkWell(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey[600],
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}