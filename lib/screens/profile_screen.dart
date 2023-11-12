import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xff2E2E2E),
        child: const Center(
          child: Text('Profile', style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}