import 'package:flutter/material.dart';

import '../../../datas/models/tech_skill.dart';

class TechSkillsSkillImage extends StatelessWidget {
  const TechSkillsSkillImage(this.techSkill, {super.key});

  final TechSkill techSkill;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 100.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              techSkill.imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
