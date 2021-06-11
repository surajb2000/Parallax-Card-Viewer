import 'package:flutter/material.dart';

import 'package:parallax_effect/slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Parallax Effect',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 80,
                width: double.infinity,
              ),
              SlidingCardsView(),
            ],
          ),
          // ExhibitionBottomSheet(),
          // Todo : Make extendable bottom sheet
        ],
      ),
    );
  }
}
