import 'package:flutter/material.dart';

class CustomRadioButtonRow<T> extends StatelessWidget {
  final List<T> options;
  final T groupValue;
  final void Function(T?) onChanged;
  final double? width;
  final double? height;

  const CustomRadioButtonRow({
    super.key,
    required this.options,
    required this.groupValue,
    required this.onChanged,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      // color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: options.map((T option) {
          return Expanded(
            child: RadioListTile<T>(
              title: FittedBox(child: Text(option.toString())),
              value: option,
              groupValue: groupValue,
              onChanged: onChanged,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 0.0), // Reduced padding
              visualDensity: VisualDensity.compact,
              dense: true,
            ),
          );
        }).toList(),
      ),
    );
  }
}
