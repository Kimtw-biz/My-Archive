part of 'layout_size_bloc.dart';

sealed class LayoutSizeState extends Equatable {
  const LayoutSizeState(this.size);

  final Size size;

  @override
  List<Object?> get props => [size];
}

final class LayoutSizeStateInitial extends LayoutSizeState {
  const LayoutSizeStateInitial({Size? size}) : super(size ?? const Size(0.0, 0.0));
}

final class LayoutSizeStateMobile extends LayoutSizeState {
  const LayoutSizeStateMobile({required Size size}) : super(size);
}

final class LayoutSizeStateTablet extends LayoutSizeState {
  const LayoutSizeStateTablet({required Size size}) : super(size);
}

final class LayoutSizeStateDesktop extends LayoutSizeState {
  const LayoutSizeStateDesktop({required Size size}) : super(size);
}
