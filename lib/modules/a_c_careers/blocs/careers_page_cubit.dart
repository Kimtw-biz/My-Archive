import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cores/blocs/careers/career_bloc.dart';
import '../../../datas/models/career.dart';

class CareersPageCubitState extends Equatable {
  const CareersPageCubitState._(this.careers);

  const CareersPageCubitState(List<Career> careers) : this._(careers);

  const CareersPageCubitState.initial(List<Career> careers) : this._(careers);

  final List<Career> careers;

  @override
  List<Object?> get props => [careers];
}

class CareersPageCubit extends Cubit<CareersPageCubitState> {
  CareersPageCubit(
    super.initialState,
    this._careerBloc,
  ) {
    _careerBlocStreamSubscription = _careerBloc.stream.listen(_onCareerBlocStateChanged);
  }

  final CareerBloc _careerBloc;
  late final StreamSubscription _careerBlocStreamSubscription;

  void _onCareerBlocStateChanged(CareerState careerState) {
    if (careerState is CareerStateSuccess) {
      final CareersPageCubitState current = CareersPageCubitState(careerState.careers);

      if (state != current) {
        emit(current);
      }
    }
  }

  @override
  Future<void> close() {
    _careerBlocStreamSubscription.cancel();

    return super.close();
  }
}
