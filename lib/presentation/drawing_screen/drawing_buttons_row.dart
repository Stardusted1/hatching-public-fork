import 'package:flutter/material.dart';

class DrawingButtonsRow extends StatelessWidget {
  final bool canExit;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final VoidCallback onRestart;

  const DrawingButtonsRow({
    super.key,
    required this.canExit,
    required this.onCancel,
    required this.onConfirm,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: onRestart,
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.square(20),
            minimumSize: const Size.square(60),
            shape: const CircleBorder(),
          ),
          child: const Icon(
            Icons.restart_alt_outlined,
            color: Colors.white,
          ),
        ),
        ElevatedButton(
          onPressed: canExit ? onConfirm : onCancel,
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.square(20),
            minimumSize: const Size.square(60),
            shape: const CircleBorder(),
          ),
          child: Icon(
            canExit ? Icons.check : Icons.clear,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
