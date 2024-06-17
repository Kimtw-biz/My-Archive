import 'package:flutter/material.dart';

class HomeAppBarMenuButtonForm extends StatelessWidget {
  const HomeAppBarMenuButtonForm({
    super.key,
    required this.label,
    required this.onButtonPressed,
  });

  final String label;
  final void Function() onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onButtonPressed,
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
