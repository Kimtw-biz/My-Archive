import 'package:flutter/material.dart';

class TechSkillsStackTitleText extends StatelessWidget {
  const TechSkillsStackTitleText(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
