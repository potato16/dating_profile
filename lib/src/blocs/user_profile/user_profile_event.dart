import 'package:dating_profile/src/bloc_helpers/bloc_event_state.dart';

class UserProfileEvent extends BlocEvent {
  UserProfileEvent({this.type = UserProfileEventType.fetch})
      : assert(type != null);
  final UserProfileEventType type;
}

enum UserProfileEventType {
  fetch,
}
