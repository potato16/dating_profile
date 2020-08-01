import 'package:dating_profile/src/utils/colors.dart';
import 'package:dating_profile/src/widgets/profile_info_widget.dart';
import 'package:dating_profile/src/widgets/profile_slide_pictures_widget.dart';
import 'package:dating_profile/src/widgets/profile_stories_widget.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: DatingColors.black1,
        elevation: 0,
        leading: CircleAvatar(
          backgroundColor: Colors.red,
        ),
        title: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'Amny Nguyen',
            style: TextStyle(
              color: DatingColors.black,
            ),
          ),
        ),
        actions: <Widget>[
          Icon(Icons.healing),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProfileSlidePicturesWidget(),
            ProfileInfoWidget(),
            ProfileStoriesWidget(),
          ],
        ),
      ),
    );
  }
}
