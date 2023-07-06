import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
    this.child,
    required this.children,
  });

  final Widget? child;
  final List<Widget> children;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;
  late final Animation<double> _expandAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [..._expandingChildren(), _notExpandedFab()],
      ),
    );
  }

  List<Widget> _expandingChildren() {
    return widget.children.reversed.mapIndexed(
      (index, element) {
        return _ExpandingActionButton(
          index: widget.children.length - index - 1,
          progress: _expandAnimation,
          child: element,
        );
      },
    ).toList();
  }

  Widget _notExpandedFab() {
    return FloatingActionButton(
      onPressed: () {
        if (!_isExpanded) {
          setState(() {
            _isExpanded = true;
          });
          _controller.forward();
        } else {
          setState(() {
            _isExpanded = false;
          });
          _controller.reverse();
        }
      },
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _animation,
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    required this.progress,
    required this.child,
    required this.index,
  });

  final int index;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          (3.14 / 180) * 90,
          16 + 8 + progress.value * 60 * (index + 1),
        );
        return Positioned(
          right: 8,
          bottom: offset.dy,
          child: SizedBox(
            width: 40,
            height: 40,
            child: Align(
              alignment: Alignment.center,
              child: child!,
            ),
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}
