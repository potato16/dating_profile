import 'dart:async';

import 'package:dating_profile/src/bloc_helpers/bloc_event_state.dart';
import 'package:dating_profile/src/blocs/user_profile/user_profile_event.dart';
import 'package:dating_profile/src/blocs/user_profile/user_profile_state.dart';
import 'package:dating_profile/src/models/user_profile.dart';
import 'package:dating_profile/src/repositories/user_profile_repository.dart';
import 'package:dating_profile/src/utils/errors.dart';
import 'package:rxdart/rxdart.dart';

class UserProfileBloc
    extends BlocEventStateBase<UserProfileEvent, UserProfileState> {
  final UserProfileRepository _userProfileRepository = UserProfileRepository();

  @override
  Stream<UserProfileState> eventHandler(
      UserProfileEvent event, UserProfileState currentState) async* {
    switch (event.type) {
      case UserProfileEventType.init:
        yield UserProfileState.fetchProfile();
        final ErrorEnum result = await _fetchProfile();

        if (result == null) {
          yield UserProfileState.fetchProfileSuccess();
        } else {
          yield UserProfileState.fetchProfileFailed();
        }

        break;
    }
  }

  final BehaviorSubject<UserProfile> _profileController =
      BehaviorSubject<UserProfile>();
  final BehaviorSubject<String> _userAvatarController =
      BehaviorSubject<String>();

  Stream<String> get userAvatar => _userAvatarController.stream;
  Stream<String> get displayName => _profileController.stream.transform(
        StreamTransformer<UserProfile, String>.fromHandlers(
          handleData: (UserProfile data, EventSink<String> sink) {
            sink.add(data?.profile?.name);
          },
        ),
      );
  Stream<UserProfile> get userProfile => _profileController.stream;

  Future<ErrorEnum> _fetchProfile() async {
    final UserProfile response = await _userProfileRepository.getUserProfile();
    if (response == null) {
      return Future<ErrorEnum>.value(ErrorEnum.noInternet);
    }
    _profileController.sink.add(response);
    return Future<ErrorEnum>.value();
  }
}
