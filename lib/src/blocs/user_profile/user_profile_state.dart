import 'package:dating_profile/src/bloc_helpers/bloc_event_state.dart';

class UserProfileState extends BlocState {
  UserProfileState({
    this.state,
    this.isProgressing,
    this.isFailed,
    this.isSuccess,
  });
  final UserProfileStateEnum state;
  final bool isProgressing;
  final bool isFailed;
  final bool isSuccess;

  factory UserProfileState.fetchProfile() {
    return UserProfileState(
        state: UserProfileStateEnum.getProfile, isProgressing: true);
  }

  factory UserProfileState.fetchProfileSuccess() {
    return UserProfileState(
        state: UserProfileStateEnum.getProfile,
        isProgressing: false,
        isSuccess: true);
  }

  factory UserProfileState.fetchProfileFailed() {
    return UserProfileState(
        state: UserProfileStateEnum.getProfile,
        isProgressing: false,
        isFailed: true);
  }
}

enum UserProfileStateEnum { getProfile }
