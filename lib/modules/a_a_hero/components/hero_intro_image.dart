import 'package:flutter/material.dart';
import 'package:flutter_my_archive/cores/values/app_image_path.dart';
import 'package:flutter_my_library/stable/widgets/fade_box.dart';

class HeroIntroImage extends StatelessWidget {
  const HeroIntroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeBox(
      duration: const Duration(milliseconds: 1500),
      child: Image.asset(AppImagePath.selfIllustration),
    );
  }
}
