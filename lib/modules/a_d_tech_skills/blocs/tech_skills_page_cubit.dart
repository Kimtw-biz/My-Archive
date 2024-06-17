import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cores/blocs/tech_skills/tech_stack_bloc.dart';
import '../../../datas/models/tech_stack.dart';

class TechSkillsPageCubit extends Cubit<TechSkillsPageCubitState> {
  TechSkillsPageCubit(
    super.initialState,
    this._techStackBloc,
  ) {
    _techStackBlocStreamSubscription = _techStackBloc.stream.listen(_onTechStackBlocStateChagned);
  }

  final TechStackBloc _techStackBloc;
  late final StreamSubscription _techStackBlocStreamSubscription;

  void _onTechStackBlocStateChagned(TechStackState techStackState) {
    if (techStackState is TechStackStateSuccess) {
      final TechSkillsPageCubitState current = TechSkillsPageCubitState(techStackState.techStacks);

      if (state != current) {
        emit(current);
      }
    }
  }

  @override
  Future<void> close() {
    _techStackBlocStreamSubscription.cancel();

    return super.close();
  }
}

class TechSkillsPageCubitState extends Equatable {
  const TechSkillsPageCubitState(this.techStacks);

  final List<TechStack> techStacks;

  @override
  List<Object?> get props => [];
}
