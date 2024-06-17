import 'package:flutter/material.dart';

import '../../../datas/enums/project_platform.dart';

class CareersProjectPlatformImage extends StatelessWidget {
  const CareersProjectPlatformImage(
    this.platform, {
    super.key,
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
