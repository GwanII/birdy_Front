import 'package:flutter/material.dart';

class MyProfileDetailScreen extends StatelessWidget {
  const MyProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("내 프로필 상세"),
      ),
      body: const Center(
        child: Text(
          "여기는 프로필 상세 페이지",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}