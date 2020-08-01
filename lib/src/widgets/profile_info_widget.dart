import 'package:dating_profile/src/utils/colors.dart';
import 'package:dating_profile/src/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Amny Nguyen',
            style: DatingTypography.t24M.copyWith(color: DatingColors.black),
          ),
          SizedBox(height: 13),
          _InfoSession(icon: Icons.tv, content: 'May 1996, 24 years old'),
          SizedBox(height: 10),
          _InfoSession(icon: Icons.tv, content: 'English teacher'),
          SizedBox(height: 10),
          _InfoSession(icon: Icons.tv, content: 'Hoa Sen university'),
          SizedBox(height: 17),
          Text(
            'Nice to meet you! Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
            style: DatingTypography.t16R.copyWith(color: DatingColors.grey),
          ),
        ],
      ),
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
          color: Colors.red,
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
