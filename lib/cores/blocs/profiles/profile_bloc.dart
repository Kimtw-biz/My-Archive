import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_my_archive/datas/models/profile.dart';
import 'package:flutter_my_archive/datas/repositories/profile_data_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(
    super.initialState, {
    ProfileDataRepository? profileDataRepository,
  }) : _profileDataRepository = profileDataRepository ?? const ProfileDataRepository() {
    on<ProfileEventStarted>(_onProfileEventStarted);
    on<ProfileEventRequested>(_onProfileEventRequested);
  }

  final ProfileDataRepository _profileDataRepository;

  void _onProfileEventStarted(ProfileEvent event, Emitter<ProfileState> emit) {
    if (state.profile != null) {
      emit(ProfileStateSuccess(state.profile));
    } else {
      //* Look for cache/emit or add request
      add(ProfileEventRequested());
    }
  }

  Future<void> _onProfileEventRequested(ProfileEvent event, Emitter<ProfileState> emit) async {
    await _profileDataRepository.getProfileData().then((profile) {
      emit(ProfileStateSuccess(profile));
    }).onError((error, stackTrace) {
      if (state.profile != null) {
        emit(ProfileStateFailure(state.profile));
      } else {
        emit(const ProfileStateFailure(null));
      }
    });
  }
}
