import 'package:flutter/material.dart';

class LiquidDataContainer extends StatelessWidget {
  const LiquidDataContainer({
    super.key,
    required this.containerColor,
    required this.transparency,
    required this.liquidName,
    required this.cups,
    required this.interactable,
    this.onPressed,
  });

  final Color containerColor;
  final double transparency;
  final String liquidName;
  final int cups;
  final bool interactable;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: containerColor.withOpacity(transparency),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border(
          top: BorderSide(color: containerColor),
          left: BorderSide(color: containerColor),
          right: BorderSide(color: containerColor),
          bottom: BorderSide(color: containerColor),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // name and increase element button on a row
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                liquidName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              if (interactable)
                IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.add_circle_sharp),
                  color: containerColor,
                )
            ],
          ),
          Text(
            '${cups.toString()} pahare',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: containerColor,
            ),
          ),
        ],
      ),
    );
  }
}
