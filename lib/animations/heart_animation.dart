import 'package:flutter/material.dart';

class HeartAnimation extends StatefulWidget {
  @override
  _HeartAnimationState createState() => _HeartAnimationState();
}

class _HeartAnimationState extends State<HeartAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Animation> _animations = [];
  final int _heartCount = 40;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    for (int i = 0; i < _heartCount; i++) {
      _animations.add(
        Tween(
          begin: Offset(0, 1),
          end: Offset(0, -1),
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(
              i / _heartCount,
              1.0,
              curve: Curves.easeInOut,
            ),
          ),
        ),
      );
    }

    // Start the animation as soon as the widget is visible
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = 0; i < _heartCount; i++) 
          AnimatedBuilder(
            animation: _animations[i],
            builder: (context, child) {
              return Positioned(
                bottom: 0,
                left: MediaQuery.of(context).size.width / 2 - 25,
                child: Transform.translate(
                  offset: Offset(
                    (i % 2 == 0 ? -1 : 1) * (i * 10.0),
                    _animations[i].value.dy *
                        MediaQuery.of(context).size.height,
                  ),
                  child: Opacity(
                    opacity: 1 - (_controller.value),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.redAccent.withOpacity(0.8),
                      size: 50,
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
