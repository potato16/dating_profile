import 'package:dating_profile/src/bloc_helpers/bloc_provider.dart';
import 'package:dating_profile/src/blocs/user_profile/user_profile_bloc.dart';
import 'package:dating_profile/src/models/user_profile.dart';
import 'package:dating_profile/src/pages/image_view_page.dart';
import 'package:dating_profile/src/utils/colors.dart';
import 'package:dating_profile/src/utils/convert.dart';
import 'package:dating_profile/src/utils/dating_icon_icons.dart';
import 'package:dating_profile/src/utils/paths.dart';
import 'package:dating_profile/src/utils/text_styles.dart';
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
                      final child = Container(
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
                      if (index != 0) {
                        return child;
                      }
                      final location =
                          e.location?.split(',')?.first?.trim() ?? '';
                      final time = timestampToDateFormat(e.date);
                      return Stack(
                        children: <Widget>[
                          child,
                          Positioned(
                            top: 22,
                            right: 16,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                if (location != null)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: ChipMoment(
                                        iconData: DatingIcon.location,
                                        content: location),
                                  ),
                                if (time.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: ChipMoment(
                                        iconData: DatingIcon.date,
                                        content: time),
                                  ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 21,
                            child: Text(
                              'When in $location',
                              style: DatingTypography.t18M.copyWith(
                                color: DatingColors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                )
                .toList(),
          );
        });
  }
}

class ChipMoment extends StatelessWidget {
  const ChipMoment({
    Key key,
    @required this.content,
    @required this.iconData,
  })  : assert(content != null && iconData != null),
        super(key: key);

  final IconData iconData;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: DatingColors.white, width: 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            iconData,
            color: DatingColors.white,
            size: 16,
          ),
          SizedBox(width: 6),
          Text(
            '$content',
            style: DatingTypography.t14M.copyWith(
              color: DatingColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
