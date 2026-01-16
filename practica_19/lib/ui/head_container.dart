import 'package:flutter/material.dart';

class HeadContainer extends StatelessWidget {
  const HeadContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.green.shade700,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: const Center(
        child: Text(
          'Lista de Personajes de Rick & Morty',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
