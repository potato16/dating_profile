import 'package:dating_profile/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewPage extends StatefulWidget {
  ImageViewPage({
    Key key,
    this.url,
  }) : super(key: key);
  final String url;

  @override
  _ImageViewPageState createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  bool showBackButton = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DatingColors.black,
      body: GestureDetector(
        onTap: () {
          showBackButton = !showBackButton;
          setState(() {});
        },
        onVerticalDragUpdate: (dragUpdateDetails) {
          Navigator.of(context).pop();
        },
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: <Widget>[
            PhotoView(
              backgroundDecoration: BoxDecoration(color: DatingColors.black),
              imageProvider: NetworkImage(widget.url ?? ''),
            ),
            if (showBackButton)
              Positioned(
                child: InkWell(
                  onTap: () => Navigator.maybePop(context),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.chevron_left,
                      color: DatingColors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
