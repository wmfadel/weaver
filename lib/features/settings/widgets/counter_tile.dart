import 'package:flutter/material.dart';
import 'package:pomo/core/constants/styles.dart';

class CounterTile extends StatelessWidget {
  final int counter;
  final String title;
  final Function() onIncrement;
  final Function() onDecrement;
  final Color backgroundColor;
  final Color textColor;

  const CounterTile(
      {required this.counter,
      required this.title,
      required this.onIncrement,
      required this.onDecrement,
      required this.backgroundColor,
      required this.textColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.titleMedium.copyWith(color: textColor)),
        const SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: textColor, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          width:  100,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      '$counter',
                      style: context.titleMedium.copyWith(color: textColor),
                    ),
                  ),
                ),
                // const SizedBox(width: 16),
                Row(
                  children: [
                    Container(color: textColor, width: 1),
                    IntrinsicWidth(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => onIncrement(),
                            child: Icon(Icons.arrow_drop_up, color: textColor),
                          ),
                          Container(color: textColor, height: 1),
                          GestureDetector(
                            onTap: () => onDecrement(),
                            child:
                                Icon(Icons.arrow_drop_down, color: textColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
