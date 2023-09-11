import 'package:flutter/material.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

class Exam223HomePage extends StatefulWidget {
  const Exam223HomePage({Key? key}) : super(key: key);

  @override
  State<Exam223HomePage> createState() => _Exam223HomePageState();
}



class _Exam223HomePageState extends State<Exam223HomePage> {
  //Stack使用的Key
  final GlobalKey _parentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: _parentKey,
      children: [
        Container(color: Colors.blueGrey),

        DraggableFloatingActionButton(
          child: Container(
            width: 60,
            height: 60,
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: Colors.red
            ),
            child: const Icon(Icons.add),
          ),
          initialOffset: const Offset(20, 70),
          parentKey: _parentKey,
          onPressed: () {},
        ),
      ],
    );
  }
}