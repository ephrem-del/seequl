import 'package:flutter/material.dart';

class ZaadyScreen extends StatelessWidget {
  const ZaadyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xff2E2E2E),
        child: const Center(
          child: Text('Qucon', style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}