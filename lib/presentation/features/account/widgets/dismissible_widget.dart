import 'package:flutter/material.dart';

class DismissibleWidget extends StatelessWidget {
  const DismissibleWidget({
    Key? key,
    required this.child,
    required this.onDismissed,
  }) : super(key: key);

  final Widget child;
  final Function(DismissDirection) onDismissed;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: onDismissed,
      direction: DismissDirection.endToStart,
      background: _buildSwipeActionLeft(),
      child: child,
    );
  }

  Widget _buildSwipeActionLeft() {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      padding: const EdgeInsets.all(20.0),
      child: Image.asset('assets/images/remove.png'),
    );
  }
}
