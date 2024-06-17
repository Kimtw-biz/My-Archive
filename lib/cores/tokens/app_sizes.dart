import 'package:flutter/widgets.dart';

abstract class AppSizes {
  static const double w0 = 0.0;
  static const double w4 = 4.0;
  static const double w8 = 8.0;
  static const double w12 = 12.0;
  static const double w16 = 16.0;
  static const double w20 = 20.0;
  static const double w24 = 24.0;
  static const double w28 = 28.0;
  static const double w32 = 32.0;
  static const double w36 = 36.0;
  static const double w40 = 40.0;
  static const double w44 = 44.0;
  static const double w48 = 48.0;
  static const double w52 = 52.0;
  static const double w56 = 56.0;
  static const double w60 = 60.0;
  static const double w64 = 64.0;
  static const double w100 = 100.0;

  static const double h0 = 0.0;
  static const double h4 = 4.0;
  static const double h8 = 8.0;
  static const double h12 = 12.0;
  static const double h16 = 16.0;
  static const double h20 = 20.0;
  static const double h24 = 24.0;
  static const double h28 = 28.0;
  static const double h32 = 32.0;
  static const double h36 = 36.0;
  static const double h40 = 40.0;
  static const double h44 = 44.0;
  static const double h48 = 48.0;
  static const double h52 = 52.0;
  static const double h56 = 56.0;
  static const double h60 = 60.0;
  static const double h64 = 64.0;
  static const double h100 = 100.0;

  static const double s0 = 0.0;
  static const double s4 = 4.0;
  static const double s8 = 8.0;
  static const double s12 = 12.0;
  static const double s16 = 16.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s28 = 28.0;
  static const double s32 = 32.0;
  static const double s36 = 36.0;
  static const double s40 = 40.0;
  static const double s44 = 44.0;
  static const double s48 = 48.0;
  static const double s52 = 52.0;
  static const double s56 = 56.0;
  static const double s60 = 60.0;
  static const double s64 = 64.0;
  static const double s100 = 100.0;

  static const double r0 = 0.0;
  static const double r4 = 4.0;
  static const double r8 = 8.0;
  static const double r12 = 12.0;
  static const double r16 = 16.0;
  static const double r20 = 20.0;
  static const double r24 = 24.0;
  static const double r28 = 28.0;
  static const double r32 = 32.0;
  static const double r36 = 36.0;
  static const double r40 = 40.0;
  static const double r44 = 44.0;
  static const double r48 = 48.0;
  static const double r52 = 52.0;
  static const double r56 = 56.0;
  static const double r60 = 60.0;
  static const double r64 = 64.0;

  static const double verticalGapTiny = h4;
  static const double verticalGapSmall = h8;
  static const double verticalGapMedium = h20;
  static const double verticalGapLarge = h40;
  static const double verticalGapExtra = h40 + h40;

  static const double horizontalGapTiny = h4;
  static const double horizontalGapSmall = h8;
  static const double horizontalGapMedium = h20;
  static const double horizontalGapLarge = h40;
  static const double horizontalGapExtra = h40 + h40;

  static const double minAppContentWidth = 0.0;
  static const double minAppContentHeight = 0.0;

  static const double maxAppContentWidth = 1024.0;
  static const double maxAppContentHeight = 968.0;

  static const double minMobileAppContentWidth = 0.0;
  static const double minMobileAppContentHeight = 0.0;

  static const double maxMobileAppContentWidth = 375.0;
  static const double maxMobileAppContentHeight = 968.0;

  static const double minResponsiveDesktopWidthThreshold = 1024.0;
  static const double minResponsiveTabletWidthThreshold = 768.0;
  static const double minResponsiveMobileWidthThreshold = 300.0;

  static Size mediaQuerySizeOf(BuildContext context) => MediaQuery.sizeOf(context);
}
