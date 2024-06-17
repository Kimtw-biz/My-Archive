part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState(this.profile);

  final Profile? profile;

  @override
  List<Object?> get props => [profile];
}

final class ProfileStateInitial extends ProfileState {
  const ProfileStateInitial(Profile? profile) : super(profile);
}

final class ProfileStateSuccess extends ProfileState {
  const ProfileStateSuccess(Profile? profile) : super(profile);

  @override
  Profile get profile => super.profile!;
}

final class ProfileStateFailure extends ProfileState {
  const ProfileStateFailure(Profile? profile) : super(profile);
}
