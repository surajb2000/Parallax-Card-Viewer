import 'dart:ui';

import 'package:flutter/material.dart';

const double minHeight = 120;

class ExhibitionBottomSheet extends StatefulWidget {
  const ExhibitionBottomSheet({Key key}) : super(key: key);

  @override
  _ExhibitionBottomSheetState createState() => _ExhibitionBottomSheetState();
}

class _ExhibitionBottomSheetState extends State<ExhibitionBottomSheet>
    with SingleTickerProviderStateMixin {
  AnimationController _controller; //<-- Create a controller

  double get maxHeight =>
      MediaQuery.of(context).size.height; //<-- Get max height of the screen

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
  }

  @override
  void dispose() {
    _controller.dispose(); //<-- and remember to dispose it!
    super.dispose();
  }

  double lerp(double min, double max) =>
      lerpDouble(min, max, _controller.value);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) {
        return AnimatedBuilder(
            animation: scrollController,
            builder: (context, child) {
              double percentage = 0.2;
              double containerHeight =
                  scrollController.position.viewportDimension;

              if (scrollController.hasClients) {
                percentage =
                    scrollController.position.viewportDimension / maxHeight;
              }
              if (scrollController.position.viewportDimension >
                  maxHeight / 2) {}

              return Scrollbar(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    color: Colors.blue,
                    height: containerHeight,
                    child: Text('yo'),
                  ),
                ),
              );
            });
      },
    );
  }
}
