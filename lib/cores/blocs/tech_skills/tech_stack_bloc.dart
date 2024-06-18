import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../datas/models/tech_stack.dart';
import '../../../datas/repositories/tech_stack_data_repository.dart';

part 'tech_stack_event.dart';
part 'tech_stack_state.dart';

class TechStackBloc extends Bloc<TechStackEvent, TechStackState> {
  TechStackBloc(
    super.initialState, {
    TechStackDataRepository? techStackDataRepository,
  }) : _techStackDataRepository = techStackDataRepository ?? const TechStackDataRepository() {
    on<TechStackEventStarted>(_onTechStackEventStarted);
    on<TechStackEventRequested>(_onTechStackEventRequested);
  }

  final TechStackDataRepository _techStackDataRepository;

  void _onTechStackEventStarted(TechStackEvent event, Emitter<TechStackState> emit) {
    if (state.techStacks != null && state.techStacks!.isNotEmpty) {
      emit(TechStackStateSuccess(state.techStacks));
    } else {
      add(TechStackEventRequested());
    }
  }

  Future<void> _onTechStackEventRequested(TechStackEvent event, Emitter<TechStackState> emit) async {
    await _techStackDataRepository.getAllTechStackDatas().then((techStacks) {
      emit(TechStackStateSuccess(techStacks));
    }).onError((error, stackTrace) {
      emit(TechStackStateFailure(state.techStacks));
    });
  }

  Future<void> onTechStackEventFailure(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("")),
    );

    debugPrint("Failure with previous data");
  }
}
