import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  int value;
  int groupValue;
  Color? color;
  Color? selectorColor;
  void Function(int?)? onChanged;
  CustomRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    this.color = Colors.grey,
    this.selectorColor = Colors.blueAccent,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          bool selected = widget.value != widget.groupValue;
          if (selected) {
            widget.onChanged!(widget.value);
          }
        },
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: widget.value == widget.groupValue
                  ? widget.selectorColor
                  : widget.color,
              shape: BoxShape.circle),
        ));
  }
}
