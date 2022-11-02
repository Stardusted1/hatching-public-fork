import 'package:flutter/material.dart';

class TestCardTrailing extends StatefulWidget {
  final bool expanded;
  final int itemsCount;

  const TestCardTrailing({
    super.key,
    required this.expanded,
    required this.itemsCount,
  });

  @override
  _TestCardTrailingState createState() => _TestCardTrailingState();
}

class _TestCardTrailingState extends State<TestCardTrailing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween(begin: .5, end: .0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TestCardTrailing oldWidget) {
    if (widget.expanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      height: 25,
      child: Stack(
        fit: StackFit.loose,
        children: [
          if (widget.itemsCount > 0)
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xffceefe6),
              ),
              child: Center(
                child: Text(
                  widget.itemsCount.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: const Color(0xff4e6e66)),
                ),
              ),
            ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              width: 25,
              height: 25,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 24,
                width: 24,
                child: RotationTransition(
                  turns: _animation,
                  child: const Icon(
                    Icons.keyboard_arrow_up_outlined,
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
