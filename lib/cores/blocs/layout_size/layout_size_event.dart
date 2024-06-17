part of 'layout_size_bloc.dart';

sealed class LayoutSizeEvent {
  const LayoutSizeEvent(this.size);

  final Size size;
}

// final class LayoutSizeEventStarted extends LayoutSizeEvent {
//   LayoutSizeEventStarted({required Size size}) : super(size);
// }

final class LayoutSizeEventChanged extends LayoutSizeEvent {
  LayoutSizeEventChanged({required Size size}) : super(size);
}
