import 'package:flutter/material.dart';

import '../../../datas/enums/project_platform.dart';

class CareersParojectPlatformImage extends StatelessWidget {
  const CareersParojectPlatformImage({
    super.key,
    required this.platform,
  });

  final ProjectPlatform platform;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 24.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          image: DecorationImage(
            image: AssetImage(
              platform.imagePath,
            ),
          ),
        ),
      ),
    );
  }
}
