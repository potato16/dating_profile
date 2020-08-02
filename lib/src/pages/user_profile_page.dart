import 'package:dating_profile/src/bloc_helpers/bloc_provider.dart';
import 'package:dating_profile/src/blocs/user_profile/user_profile_bloc.dart';
import 'package:dating_profile/src/blocs/user_profile/user_profile_event.dart';
import 'package:dating_profile/src/blocs/user_profile/user_profile_state.dart';
import 'package:dating_profile/src/utils/colors.dart';
import 'package:dating_profile/src/utils/paths.dart';
import 'package:dating_profile/src/utils/text_styles.dart';
import 'package:dating_profile/src/widgets/heart_widget.dart';
import 'package:dating_profile/src/widgets/profile_info_widget.dart';
import 'package:dating_profile/src/widgets/profile_slide_pictures_widget.dart';
import 'package:dating_profile/src/widgets/profile_stories_widget.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfilePage> {
  UserProfileBloc bloc;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  void initState() {
    bloc = UserProfileBloc();
    bloc.emitEvent(UserProfileEvent());

    bloc.state.listen((event) {
      if (!event.isProgressing) {
        if (event.isFailed) {
          _refreshController.refreshFailed();
        } else {
          _refreshController.refreshCompleted();
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
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
        body: SmartRefresher(
          controller: _refreshController,
          onRefresh: _onRefresh,
          //  onLoading: _onLoading,
          header: MaterialClassicHeader(
            backgroundColor: DatingColors.white,
            color: Colors.blue,
          ),
          child: SingleChildScrollView(
            child: StreamBuilder<UserProfileState>(
                stream: bloc.state,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  if (snapshot.data.isFailed) {
                    return Column(
                      children: <Widget>[
                        Image.asset(Paths.dog),
                        Text('Something went wrong!'),
                      ],
                    );
                  }
                  return Column(
                    children: <Widget>[
                      ProfileSlidePicturesWidget(),
                      ProfileInfoWidget(),
                      SizedBox(
                        height: 34,
                      ),
                      ProfileStoriesWidget(),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    bloc.emitEvent(UserProfileEvent(type: UserProfileEventType.fetch));
  }
}
