import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  final Function(Color color) onColorSelected;

  const ColorPicker({
    super.key,
    required this.onColorSelected,
  });

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  int? selectedIndex;

  void selectColor(int index) {
    setState(() {
      selectedIndex = index;
    });

    widget.onColorSelected(colors[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        colors.length,
        (index) {
          final bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => selectColor(index),
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: colors[index],
                shape: BoxShape.circle,
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}