import 'package:flutter/material.dart';

class AuthForm<T> extends StatefulWidget {
  final Function(String)? onChanged;
  final InputDecoration? decoration;
  final bool obscureText;


  const AuthForm({
    required this.onChanged,
    required this.decoration,
    required this.obscureText,
    super.key,
  });

  @override
  State<AuthForm<T>> createState() => _AuthFormState<T>();
}

class _AuthFormState<T> extends State<AuthForm<T>> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      decoration: widget.decoration,
      obscureText: widget.obscureText,
    );
  }
}
