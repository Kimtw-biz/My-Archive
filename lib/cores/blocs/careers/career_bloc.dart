import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../datas/models/career.dart';
import '../../../datas/repositories/career_data_repository.dart';

part 'career_event.dart';
part 'career_state.dart';

class CareerBloc extends Bloc<CareerEvent, CareerState> {
  CareerBloc(
    super.initialState, {
    CareerDataRepository? careerDataRepository,
  }) : _careerDataRepository = careerDataRepository ?? const CareerDataRepository() {
    on<CareerEventStarted>(_onCareerEventStarted);
    on<CareerEventRequested>(_onCareerEventRequested);
  }

  final CareerDataRepository _careerDataRepository;

  void _onCareerEventStarted(CareerEvent event, Emitter<CareerState> emit) {
    if (state.careers != null) {
      emit(CareerStateSuccess(state.careers));
    } else {
      add(CareerEventRequested());
    }
  }

  Future<void> _onCareerEventRequested(CareerEvent event, Emitter<CareerState> emit) async {
    await _careerDataRepository.getAllCareerDatas().then((careers) {
      emit(CareerStateSuccess(careers));
    }).onError((error, stackTrace) {
      emit(CareerStateFailure(state.careers));
    });
  }
}
