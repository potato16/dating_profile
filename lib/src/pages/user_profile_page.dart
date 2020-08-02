import 'package:dating_profile/src/bloc_helpers/bloc_provider.dart';
import 'package:dating_profile/src/blocs/user_profile/user_profile_bloc.dart';
import 'package:dating_profile/src/blocs/user_profile/user_profile_event.dart';
import 'package:dating_profile/src/utils/colors.dart';
import 'package:dating_profile/src/utils/dating_icon_icons.dart';
import 'package:dating_profile/src/utils/paths.dart';
import 'package:dating_profile/src/utils/text_styles.dart';
import 'package:dating_profile/src/widgets/profile_info_widget.dart';
import 'package:dating_profile/src/widgets/profile_slide_pictures_widget.dart';
import 'package:dating_profile/src/widgets/profile_stories_widget.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfilePage> {
  UserProfileBloc bloc;
  @override
  void initState() {
    bloc = UserProfileBloc();
    bloc.emitEvent(UserProfileEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserProfileBloc>(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: DatingColors.white,
          elevation: 0,
          leading: Center(
            child: StreamBuilder<String>(
                stream: bloc.userAvatar,
                builder: (context, snapshot) {
                  return CircleAvatar(
                    radius: 14,
                    backgroundColor: DatingColors.grey,
                    backgroundImage: snapshot.hasData
                        ? NetworkImage(snapshot.data)
                        : AssetImage(Paths.imgPlaceHolder),
                  );
                }),
          ),
          centerTitle: false,
          titleSpacing: 0,
          title: StreamBuilder<String>(
              stream: bloc.displayName,
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? '',
                  style:
                      DatingTypography.t14M.copyWith(color: DatingColors.black),
                );
              }),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: HeartWidget(),
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
      ),
    );
  }
}

class HeartWidget extends StatelessWidget {
  const HeartWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      DatingIcon.heart_empty,
      color: DatingColors.red,
      size: 18,
    );
  }
}
