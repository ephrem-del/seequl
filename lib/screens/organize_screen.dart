import 'package:flutter/material.dart';

class OrganizeScreen extends StatelessWidget {
  const OrganizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xff2E2E2E),
        child: const Center(
          child: Text('Organize', style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}