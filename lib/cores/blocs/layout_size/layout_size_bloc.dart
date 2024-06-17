import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../tokens/app_sizes.dart';

part 'layout_size_event.dart';
part 'layout_size_state.dart';

class LayoutSizeBloc extends Bloc<LayoutSizeEvent, LayoutSizeState> {
  LayoutSizeBloc({
    required LayoutSizeState initialState,
  }) : super(initialState) {
    on<LayoutSizeEventChanged>(_onLayoutSizeEventChanged);
  }

  double get width => state.size.width;
  double get height => state.size.height;

  //? Change to 16 by 9
  double get maxContentWidth => switch (state.size.width) {
        > AppSizes.maxAppContentWidth => AppSizes.maxAppContentWidth,
        _ => state.size.width,
      };
  double get maxContentHeight => switch (state.size.height) {
        > AppSizes.maxAppContentHeight => AppSizes.maxAppContentHeight,
        _ => state.size.height,
      };

  double get maxMobileContentWidth => switch (state.size.width) {
        > AppSizes.maxMobileAppContentWidth => AppSizes.maxMobileAppContentWidth,
        _ => state.size.width,
      };

  double get maxMobileContentHeight => switch (state.size.height) {
        > AppSizes.maxMobileAppContentHeight => AppSizes.maxMobileAppContentHeight,
        _ => state.size.height,
      };

  void _onLayoutSizeEventChanged(LayoutSizeEvent event, Emitter<LayoutSizeState> emit) {
    emit(switch (event.size.width) {
      >= AppSizes.minResponsiveDesktopWidthThreshold => LayoutSizeStateDesktop(size: event.size),
      _ => LayoutSizeStateMobile(size: event.size),
    });
  }
}
