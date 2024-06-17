import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cores/blocs/profiles/profile_bloc.dart';
import '../../../datas/models/profile.dart';

class ProfilePageCubitState extends Equatable {
  const ProfilePageCubitState._(this.profile);

  const ProfilePageCubitState(Profile profile) : this._(profile);

  const ProfilePageCubitState.initial(Profile profile) : this._(profile);

  final Profile profile;

  @override
  List<Object?> get props => [profile];
}

class ProfilePageCubit extends Cubit<ProfilePageCubitState> {
  ProfilePageCubit(super.initialState, this._profileBloc) {
    _profileBlocStateSubscription = _profileBloc.stream.listen(_onProfileBlocStateChanged);
  }

  final ProfileBloc _profileBloc;
  late final StreamSubscription<ProfileState> _profileBlocStateSubscription;

  void _onProfileBlocStateChanged(ProfileState profileState) {
    if (profileState is ProfileStateSuccess) {
      final ProfilePageCubitState currentState = ProfilePageCubitState(profileState.profile);

      if (state != currentState) {
        emit(currentState);
      }
    }
  }

  @override
  Future<void> close() {
    _profileBlocStateSubscription.cancel();

    return super.close();
  }
}
