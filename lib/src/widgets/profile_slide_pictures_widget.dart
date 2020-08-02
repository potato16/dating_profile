import 'package:dating_profile/app.dart';
import 'package:dating_profile/src/bloc_helpers/bloc_provider.dart';
import 'package:dating_profile/src/blocs/user_profile/user_profile_bloc.dart';
import 'package:dating_profile/src/models/user_profile.dart';
import 'package:dating_profile/src/pages/image_view_page.dart';
import 'package:dating_profile/src/utils/paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dating_profile/src/utils/colors.dart';

class ProfileSlidePicturesWidget extends StatefulWidget {
  @override
  _ProfileSlidePicturesWidgetState createState() =>
      _ProfileSlidePicturesWidgetState();
}

class _ProfileSlidePicturesWidgetState
    extends State<ProfileSlidePicturesWidget> {
  PageController controller;
  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProfileBloc bloc = BlocProvider.of<UserProfileBloc>(context);
    return StreamBuilder<UserProfile>(
        stream: bloc.userProfile,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          final UserProfile userProfile = snapshot.data;
          final List<String> images = userProfile?.profile?.images ?? [];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: controller,
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) => ImageViewPage(
                          url: images.elementAt(index),
                        ),
                      ),
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        image: images.elementAt(index),
                        placeholder: Paths.imgPlaceHolder,
                      ),
                    );
                  },
                ),
              ),
              AnimatedBuilder(
                  animation: controller,
                  builder: (context, snapshot) {
                    return CustomPaint(
                      painter: SlideIndicator(
                        count: images.length,
                        scrollValue: controller.hasClients
                            ? (controller.page ?? 0)
                            : 0.0,
                      ),
                      child: Container(height: 28),
                    );
                  }),
            ],
          );
        });
  }
}

class SlideIndicator extends CustomPainter {
  SlideIndicator({
    Color dotColor,
    Color indicatorColor,
    this.dotGap: 5,
    @required this.count,
    @required this.scrollValue,
    this.dotRadius: 2,
  })  : assert(count >= 0, 'Number of indicators must at greater than zero'),
        assert(scrollValue != null, 'scrollValue can not be null'),
        dotColor = dotColor ?? DatingColors.blue1,
        indicatorColor = indicatorColor ?? DatingColors.blue;
  final int count;
  final double dotRadius;
  final double dotGap;
  final Color dotColor;
  final Color indicatorColor;
  final double scrollValue;
  @override
  void paint(Canvas canvas, Size size) {
    final leftPosition = scrollValue.floor();
    final scrollPercent = scrollValue - leftPosition;
    final dotBetweenDistance = dotGap + dotRadius * 2;
    final startDx = size.width / 2 - dotBetweenDistance * count / 2;
    for (int i = 0; i <= count; i++) {
      canvas.drawCircle(
          Offset(startDx + i * dotBetweenDistance, size.height / 2),
          dotRadius,
          Paint()..color = dotColor);
    }
    final delayScroll = (scrollPercent - 0.3).clamp(0.0, 1.0) / 0.7;
    final powerUpScroll = (scrollPercent * 2).clamp(0.0, 1.0);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(
              startDx -
                  dotRadius +
                  dotBetweenDistance * (leftPosition + powerUpScroll),
              size.height / 2 - dotRadius,
              startDx +
                  dotRadius +
                  dotBetweenDistance * (leftPosition + 1 + delayScroll),
              size.height / 2 + dotRadius),
          Radius.circular(dotRadius),
        ),
        Paint()..color = indicatorColor);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
