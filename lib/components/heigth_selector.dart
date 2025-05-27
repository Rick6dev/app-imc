import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';

class HeigthSelector extends StatefulWidget {
  final double height;
  final Function(double) OnHeightChange;

  const HeigthSelector({
    super.key,
    required this.height,
    required this.OnHeightChange,
  });

  @override
  State<HeigthSelector> createState() => _HeigthSelectorState();
}

class _HeigthSelectorState extends State<HeigthSelector> {
  // double height = 190;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 15, top: 15, right: 16),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              "Altura",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            Text(
              "${widget.height.toStringAsFixed(0)} cm",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 58,
              ),
            ),
            Slider(
              value: widget.height,
              onChanged: (value) {
                widget.OnHeightChange(value);
              },
              min: 150,
              max: 220,
              divisions: 70,

              label: "${widget.height}",
              activeColor: AppColors.accent,
            ),
          ],
        ),
      ),
    );
  }
}
