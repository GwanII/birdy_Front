import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'myProfileDetailScreen.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  File? _profileImage;

  // 갤러리 열기 함수
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 🔹 상단 헤더
          Container(
            color: Colors.lightBlue[200],
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            child: const Center(
              child: Text(
                "AUCTION",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),

          // 🔹 "프로필 >"
          ListTile(
            title: const Text(
              "프로필",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MyProfileDetailScreen(),
                ),
              );
            },
          ),

          // 🔹 프로필 카드
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50, // 사진 크기 강조
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : const NetworkImage("https://via.placeholder.com/150")
                            as ImageProvider,
                  ),
                ),
                const SizedBox(width: 20), // 간격

                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "갸 니",
                      style: TextStyle(
                        fontSize: 18, // 이름은 살짝 크게
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "개수 : 37개",
                      style: TextStyle(fontSize: 14, height: 1.5,),  
                    ),
                    Text(
                      "보유 포인트 : 150000",
                      style: TextStyle(fontSize: 14, height: 1.5,),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Divider(height: 16, thickness: 1),

          // 🔹 메뉴 리스트
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                sectionTitle("결제"),
                buildMenuItem("포인트 결제"),
                buildMenuItem("포인트 현금 변환"),
                buildMenuItem("포인트 구매 내역"),
                const Divider(height: 24, thickness: 1),

                sectionTitle("마이 옵션"),
                buildMenuItem("물건 구매 내역"),
                buildMenuItem("물건 판매 내역"),
                buildMenuItem("찜 목록"),
                const Divider(height: 24, thickness: 1),

                sectionTitle("고객 센터"),
                buildMenuItem("고객 센터"),
                buildMenuItem("설정"),
                buildMenuItem("앱 평가"),
              ],
            ),
          ),
        ],
      ), // 👈 Column 닫는 괄호

      // 🔹 하단 네비게이션 바
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightBlue[200],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows),
            label: "",
          ),
        ],
      ),
    ); // 👈 Scaffold 닫는 괄호
  }

  // 🔹 섹션 제목
  static Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0, top: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
      ),
    );
  }

  // 🔹 메뉴 아이템
  static Widget buildMenuItem(String title) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        debugPrint("$title 클릭됨!");
      },
    );
  }
}
