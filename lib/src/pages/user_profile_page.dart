import 'package:dating_profile/src/utils/colors.dart';
import 'package:dating_profile/src/utils/dating_icon_icons.dart';
import 'package:dating_profile/src/utils/text_styles.dart';
import 'package:dating_profile/src/widgets/profile_info_widget.dart';
import 'package:dating_profile/src/widgets/profile_slide_pictures_widget.dart';
import 'package:dating_profile/src/widgets/profile_stories_widget.dart';
import 'package:dating_profile/src/painters/heart_painter.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final urlAvatar =
        'https://images.unsplash.com/photo-1596248048427-bbd1d2812547?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80';
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: DatingColors.white,
        elevation: 0,
        leading: Center(
          child: CircleAvatar(
            radius: 14,
            backgroundColor: DatingColors.grey,
            backgroundImage: NetworkImage(urlAvatar),
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
        title: Text(
          'Amny Nguyen',
          style: DatingTypography.t14M.copyWith(color: DatingColors.black),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Icon(DatingIcon.heart_empty, color: DatingColors.red),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProfileSlidePicturesWidget(),
            ProfileInfoWidget(),
            SizedBox(
              height: 34,
            ),
            ProfileStoriesWidget(),
          ],
        ),
      ),
    );
  }
}
