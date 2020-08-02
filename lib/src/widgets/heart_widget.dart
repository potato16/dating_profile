import 'package:dating_profile/src/bloc_helpers/bloc_provider.dart';
import 'package:dating_profile/src/blocs/user_profile/user_profile_bloc.dart';
import 'package:dating_profile/src/utils/colors.dart';
import 'package:dating_profile/src/utils/dating_icon_icons.dart';
import 'package:flutter/material.dart';

class HeartWidget extends StatefulWidget {
  const HeartWidget({
    Key key,
  }) : super(key: key);

  @override
  _HeartWidgetState createState() => _HeartWidgetState();
}

class _HeartWidgetState extends State<HeartWidget>
    with SingleTickerProviderStateMixin {
  UserProfileBloc bloc;
  bool isLove = false;
  AnimationController animationController;
  Animation heartPulse;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    heartPulse = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (isLove) {
            animationController.repeat();
          }
        }
      });

    bloc = BlocProvider.of<UserProfileBloc>(context);
    bloc.love.listen((value) {
      isLove = value;
      if (isLove) {
        animationController.forward();
      } else {
        animationController.stop();
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bloc.giveLove(!isLove);
      },
      child: AnimatedBuilder(
        builder: (context, snapshot) {
          return ScaleTransition(
            scale: heartPulse,
            child: Icon(
              isLove ? DatingIcon.heart : DatingIcon.heart_empty,
              color: DatingColors.red,
              size: 18,
            ),
          );
        },
        animation: heartPulse,
      ),
    );
  }
}
