import 'package:dating_profile/src/bloc_helpers/bloc_provider.dart';
import 'package:dating_profile/src/blocs/user_profile/user_profile_bloc.dart';
import 'package:dating_profile/src/models/user_profile.dart';
import 'package:dating_profile/src/utils/colors.dart';
import 'package:dating_profile/src/utils/dating_icon_icons.dart';
import 'package:dating_profile/src/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProfileBloc userBloc = BlocProvider.of<UserProfileBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: StreamBuilder<UserProfile>(
          stream: userBloc.userProfile,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            final UserProfile userProfile = snapshot.data;

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  userProfile?.profile?.name ?? '',
                  style:
                      DatingTypography.t24M.copyWith(color: DatingColors.black),
                ),
                SizedBox(height: 13),
                _InfoSession(
                    icon: DatingIcon.date,
                    content: userProfile?.profile?.birthdate?.toString() ?? ''),
                SizedBox(height: 10),
                _InfoSession(
                    icon: DatingIcon.work,
                    content: userProfile?.profile?.work ?? ''),
                SizedBox(height: 10),
                _InfoSession(
                    icon: DatingIcon.education,
                    content: userProfile?.profile?.education ?? ''),
                SizedBox(height: 17),
                Text(
                  userProfile?.profile?.bio ?? '',
                  style:
                      DatingTypography.t16R.copyWith(color: DatingColors.grey),
                ),
              ],
            );
          }),
    );
  }
}

class _InfoSession extends StatelessWidget {
  const _InfoSession({
    Key key,
    @required this.icon,
    @required this.content,
  })  : assert(icon != null && content != null),
        super(key: key);
  final IconData icon;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: DatingColors.red,
          size: 18,
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          content,
          style: DatingTypography.t16R.copyWith(color: DatingColors.black),
        ),
      ],
    );
  }
}
