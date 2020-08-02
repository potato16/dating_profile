import 'package:dating_profile/src/bloc_helpers/bloc_provider.dart';
import 'package:dating_profile/src/blocs/user_profile/user_profile_bloc.dart';
import 'package:dating_profile/src/models/user_profile.dart';
import 'package:dating_profile/src/pages/image_view_page.dart';
import 'package:dating_profile/src/utils/paths.dart';
import 'package:flutter/material.dart';

class ProfileStoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final UserProfileBloc bloc = BlocProvider.of(context);
    return StreamBuilder<UserProfile>(
        stream: bloc.userProfile,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          final UserProfile userProfile = snapshot.data;
          final List<Moment> moments = userProfile?.profile?.moment ?? [];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: moments
                .map(
                  (e) => Wrap(
                    spacing: 1,
                    runSpacing: 1,
                    children: List.generate(e.images.length, (index) {
                      return Container(
                        height: index % 3 == 0 ? width : width / 2,
                        width: index % 3 == 0 ? width : width / 2 - 0.5,
                        child: InkWell(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => ImageViewPage(
                              url: e.images.elementAt(index),
                            ),
                          ),
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: Paths.imgPlaceHolder,
                            image: e.images.elementAt(index),
                          ),
                        ),
                      );
                    }),
                  ),
                )
                .toList(),
          );
        });
  }
}
