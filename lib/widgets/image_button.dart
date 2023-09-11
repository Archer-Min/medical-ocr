import 'package:flutter/material.dart';

import '../res/colors.dart';

class ImageButton extends StatefulWidget {
  const ImageButton({
    super.key,
    required this.imagePath,
    this.clickTime,
  });

  final String imagePath;
  final int? clickTime;

  @override
  State<ImageButton> createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 38,
        height: 30,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: InkWell(
            child: Row(
          children: [
            Image(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
                color: Colours.scoreColor),
            Text('${widget.clickTime}',style: TextStyle(fontSize: 10),)
          ],
        )));
  }
}

class ImageButton2 extends StatefulWidget {
  const ImageButton2({
    super.key,
    required this.imagePath,
    this.likeOrUnlikeTime,
    this.request,
  });

  final String imagePath;

  ///点赞和踩数据请求返回int
  final int? likeOrUnlikeTime;
  final VoidCallback? request;

  @override
  State<ImageButton2> createState() => _ImageButton2State();
}

class _ImageButton2State extends State<ImageButton2> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        height: 25,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: InkWell(
            onTap: () {
              setState(() {
                _isLiked = !_isLiked;
              });
            },
            child: Row(
              children: [
                Image(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.cover,
                  color: _isLiked ? Colours.scoreColor : Colors.black54,
                ),
                Text('${widget.likeOrUnlikeTime}',style: TextStyle(fontSize: 10),)
              ],
            )));
  }
}
