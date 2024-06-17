import 'package:flutter/material.dart';

class TechSkillsSkillLabelText extends StatelessWidget {
  const TechSkillsSkillLabelText(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.replaceAll(" ", "\n"),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}
