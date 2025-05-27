import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_style.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weigth;
  const ImcResultScreen({
    super.key,
    required this.weigth,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: toolbarResult(),
      backgroundColor: AppColors.background,
      body: bodyResult(),
    );
  }

  Padding bodyResult() {
    double fixedHeight = height / 100;
    double imcResult = weigth / (fixedHeight * fixedHeight);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "El resultado de IMC es:",
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 32,
                bottom: 32,
                left: 15,
                right: 15,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      getStatus(imcResult),
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: getColor(imcResult),
                      ),
                    ),
                    Text(
                      imcResult.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 88,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 17),
                      child: Text(
                        getDescription(imcResult),
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Regresar", style: TextStyles.bodyStyle),
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getColor(double imcResult) {
    return switch (imcResult) {
      < 18.5 => Colors.blue, //IMC Bajo
      < 24.9 => Colors.green,
      < 29.99 => Colors.orange, //Sobrepeso
      _ => Colors.red, //Obesidad
    };
  }

  String getStatus(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "Bajo",
      < 24.5 => "Normal",
      < 29.99 => "Sobrepeso",
      _ => "Obesidad",
    };
  }

  String getDescription(double imcResult) {
    return switch (imcResult) {
      < 18.5 =>
        "Busca asesoramiento médico para ganar peso de forma segura y nutritiva.",
      < 24.5 => "Mantén tus hábitos actuales de alimentación y ejercicio.",
      < 29.99 =>
        "Considera ajustes en tu dieta y aumenta tu actividad física para alcanzar un peso ideal.",
      _ =>
        "Es crucial que consultes a un profesional de la salud para desarrollar un plan integral de pérdida de peso",
    };
  }

  AppBar toolbarResult() {
    return AppBar(
      title: Text("Resultado", style: TextStyles.bodyStyle),
      backgroundColor: AppColors.backgroundComponent,
      foregroundColor: Colors.white,
    );
  }
}
