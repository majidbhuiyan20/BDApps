import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final bool isMobile;
  const ProfileHeader({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.indigoAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: CircleAvatar(
              radius: isMobile ? 60 : 80,
              backgroundColor: Colors.grey[200],
              backgroundImage: const AssetImage('assets/images/majid.png'),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Majid Bhuiyan',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Text(
            'Mobile Application Developer (Flutter)',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          _buildContactInfo(isMobile),
        ],
      ),
    );
  }

  Widget _buildContactInfo(bool isMobile) {
    if (isMobile) {
      return Column(
        children: [
          _contactItem(Icons.email, 'majid.bhuiyan2021@gmail.com'),
          _contactItem(Icons.phone, '+8801735683137'),
          _contactItem(Icons.link, 'LinkedIn: majid-bhuiyan'),
          _contactItem(Icons.code, 'GitHub: majidbhuiyan20'),
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _contactItem(Icons.email, 'majid.bhuiyan2021@gmail.com'),
              const SizedBox(width: 25),
              _contactItem(Icons.phone, '+8801735683137'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _contactItem(Icons.link, 'LinkedIn: majid-bhuiyan'),
              const SizedBox(width: 25),
              _contactItem(Icons.code, 'GitHub: majidbhuiyan20'),
            ],
          ),
        ],
      );
    }
  }

  Widget _contactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white70, size: 16),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}
