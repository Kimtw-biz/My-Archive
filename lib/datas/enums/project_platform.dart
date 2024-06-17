import '../../cores/values/app_icon_path.dart';

enum ProjectPlatform {
  nativeWeb(AppIconPath.platformWebColored),
  nativeIOS(AppIconPath.platformIOSColored),
  nativeAndroid(AppIconPath.platformAndroidColored),
  nativeWindows(AppIconPath.paltformNoTexture),
  nativeLinux(AppIconPath.paltformNoTexture),
  nativeMacOS(AppIconPath.paltformNoTexture),
  flutterWeb(AppIconPath.platformWebColored),
  flutterIOS(AppIconPath.platformIOSColored),
  flutterAndroid(AppIconPath.platformAndroidColored),
  flutterWindows(AppIconPath.paltformNoTexture),
  flutterLinux(AppIconPath.paltformNoTexture),
  flutterMacOS(AppIconPath.paltformNoTexture);

  final String imagePath;

  const ProjectPlatform(this.imagePath);

  static ProjectPlatform parse(int index) => ProjectPlatform.values[index];

  static List<ProjectPlatform> parseAll(List<int> source) => source
      .map<ProjectPlatform>(
        (e) => ProjectPlatform.values[e],
      )
      .toList(growable: false);
}
