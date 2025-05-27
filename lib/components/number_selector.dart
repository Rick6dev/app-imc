import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';

class NumberSelector extends StatefulWidget {
  final String title;
  final Function() onIncrement;
  final Function() onDecrement;
  final int value;
  // final Int value;
  const NumberSelector({
    super.key,
    required this.title,
    required this.onIncrement,
    required this.value,
    required this.onDecrement,
  });

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Container(
          height: 200,
          width: 250,
          decoration: BoxDecoration(
            color: AppColors.backgroundComponent,
            borderRadius: BorderRadius.circular(16),
          ),

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                widget.value.toString(),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      heroTag: null,
                      onPressed: () {
                        widget.onDecrement();
                      },
                      shape: CircleBorder(),
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.remove, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 18,
                      right: 10,
                      top: 0,
                      bottom: 10,
                    ),
                    child: FloatingActionButton(
                      heroTag: null,
                      onPressed: () {
                        widget.onIncrement();
                      },
                      shape: CircleBorder(),
                      child: Icon(Icons.add, color: Colors.white),
                      backgroundColor: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
