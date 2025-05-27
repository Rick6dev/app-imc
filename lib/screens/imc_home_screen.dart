import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/heigth_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_style.dart';
import 'package:imc_calculator/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 20;
  int selectedWeigth = 80;
  double selectHeight = 130;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GenderSelector(),
        HeigthSelector(
          height: selectHeight,
          OnHeightChange: (value) {
            setState(() {
              selectHeight = value;
            });
          },
        ),
        Row(
          children: [
            NumberSelector(
              title: "Peso",
              value: selectedWeigth,
              onIncrement: () {
                setState(() {
                  selectedWeigth++;
                });
              },
              onDecrement: () {
                setState(() {
                  selectedWeigth--;
                });
              },
            ),
            NumberSelector(
              title: "Edad",
              value: selectedAge,
              onIncrement: () {
                setState(() {
                  selectedAge++;
                });
              },
              onDecrement: () {
                setState(() {
                  selectedAge--;
                });
              },
            ),

            // NumberSelector(title: "Edad"),
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ImcResultScreen(
                          height: selectHeight,
                          weigth: selectedWeigth,
                        ),
                  ),
                );
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text("Calcular", style: TextStyles.bodyStyle),
            ),
          ),
        ),
      ],
    );
  }
}
