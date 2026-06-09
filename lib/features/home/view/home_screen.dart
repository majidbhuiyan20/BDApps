import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import '../widgets/section_title.dart';
import '../widgets/info_card.dart';
import '../widgets/experience_item.dart';
import '../widgets/skill_chip.dart';
import '../widgets/project_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 700;
    final double horizontalPadding = isMobile ? 20.0 : size.width * 0.15;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(isMobile: isMobile),
            
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1100),
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Professional Summary ---
                    const SectionTitle(title: 'Professional Summary'),
                    const InfoCard(
                      child: Text(
                        'Flutter developer with 1.5+ years of hands-on experience building and shipping production-grade cross-platform mobile applications for Android and iOS. Proficient in Clean Architecture, MVVM, state management (Provider, Riverpod, GetX), and RESTful API integration. Delivered real apps on the Google Play Store, contributed to AI-powered features, and achieved 2nd Runner-Up at Geeky Solutions Learnathon 3.0 among 1000+ competing teams. Passionate about writing clean, scalable, and maintainable code.',
                        style: TextStyle(fontSize: 16, height: 1.6),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // --- Work Experience ---
                    const SectionTitle(title: 'Work Experience'),
                    const ExperienceItem(
                      role: 'Flutter Developer',
                      company: 'Softvence Delta',
                      duration: 'Nov 2025 – Jun 2026',
                      location: 'Dhaka, Bangladesh',
                      description: '• Built and maintained multiple production Flutter apps for Android and iOS, published on the Google Play Store.\n'
                          '• Architected scalable codebases using Clean Architecture and MVVM.\n'
                          '• Managed complex UI state using Provider and Riverpod; improved widget rebuild efficiency.\n'
                          '• Integrated secure RESTful APIs via Dio with token refresh and local storage caching.\n'
                          '• Collaborated with backend developers, UI/UX designers, and QA in Agile sprints.',
                    ),
                    const ExperienceItem(
                      role: 'Flutter Developer (Intern)',
                      company: 'Softaar Technologies',
                      duration: 'Jul 2025 – Oct 2025',
                      location: 'Remote',
                      description: '• Developed cross-platform apps contributing to an AI-powered product.\n'
                          '• Implemented Firebase Authentication and Cloud Firestore for real-time sync.\n'
                          '• Built AI integration features for generating garden and interior design concepts from user prompts using LLM APIs.\n'
                          '• Followed Clean Architecture principles; maintained consistent version control workflows via Git/GitHub.',
                    ),
                    const ExperienceItem(
                      role: 'Flutter Developer Trainee',
                      company: 'Geeky Solutions',
                      duration: 'Nov 2024 – May 2025',
                      location: 'Remote',
                      description: '• Selected from 169 shortlisted teams out of 1000+ in Geeky Solutions Learnathon 3.0.\n'
                          '• Achieved 2nd Runner-Up among all Flutter teams for outstanding project development.\n'
                          '• Built VoiceBridge, a child learning app using MVVM and Agile methodologies.\n'
                          '• Integrated Flame Engine for interactive gamification features.',
                    ),
                    const SizedBox(height: 40),

                    // --- Projects ---
                    const SectionTitle(title: 'Key Projects'),
                    const ProjectItem(
                      title: 'Ayni Wellness (Flutter, REST API, Firebase)',
                      desc: 'Contributed to a live wellness app on the Play Store delivering personalized guidance via AI. Built reusable, testable UI components and participated in performance optimization.',
                    ),
                    const Divider(height: 30),
                    const ProjectItem(
                      title: 'VoiceBridge – Child Learning App',
                      desc: 'Built a gamified learning app for children (3–8) using the Flame engine. Recognized at Learnathon 3.0 as a top-performing project.',
                    ),
                    const Divider(height: 30),
                    const ProjectItem(
                      title: 'Flutter E-Commerce App',
                      desc: 'Full-featured app with product browsing, cart management, and checkout flow using Provider and REST API.',
                    ),
                    const Divider(height: 30),
                    const ProjectItem(
                      title: 'EduNotify – Schedule & Notification App',
                      desc: 'Real-time scheduling app with role-based access using Firebase Cloud Messaging and Firestore for instant updates.',
                    ),
                    const SizedBox(height: 40),

                    // --- Technical Skills ---
                    const SectionTitle(title: 'Technical Skills'),
                    const Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        SkillChip(label: 'Flutter'),
                        SkillChip(label: 'Dart'),
                        SkillChip(label: 'iOS (Swift, SwiftUI)'),
                        SkillChip(label: 'Firebase'),
                        SkillChip(label: 'Flame Engine'),
                        SkillChip(label: 'Clean Architecture'),
                        SkillChip(label: 'MVVM'),
                        SkillChip(label: 'Provider'),
                        SkillChip(label: 'Riverpod'),
                        SkillChip(label: 'GetX'),
                        SkillChip(label: 'RESTful API (Dio)'),
                        SkillChip(label: 'Go (Golang)'),
                        SkillChip(label: 'SQL (PostgreSQL, SQLite)'),
                        SkillChip(label: 'Git/GitHub'),
                        SkillChip(label: 'Agile/Scrum'),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text('Languages: C, C++, Java, Dart, Swift, Go', style: TextStyle(fontSize: 14, color: Colors.grey)),
                    const SizedBox(height: 40),

                    // --- Problem Solving ---
                    const SectionTitle(title: 'Problem Solving'),
                    const InfoCard(
                      child: Text(
                        'Solved 700+ competitive programming problems across Codeforces, LeetCode, CodeChef, and Beecrowd. Strong foundation in Data Structures and Algorithms.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // --- Education & Achievements ---
                    const SectionTitle(title: 'Education & Achievements'),
                    const InfoCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('University of Rajshahi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          Text('Bachelor of Science (B.Sc.) in Computer Science and Engineering (Graduated 2025)'),
                          SizedBox(height: 15),
                          Text('• 2nd Runner-Up, Geeky Solutions Learnathon 3.0 (Brain Station 23 sponsored)', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                          Text('• Shipped and maintained a live production app (Ayni Wellness) on Play Store.'),
                          Text('• Solved 500+ problems on LeetCode & Codeforces.'),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 40),

                    // --- Additional Skills ---
                    const SectionTitle(title: 'Additional Skills'),
                    const InfoCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• Tools: Postman, Figma, Adobe Photoshop, Illustrator', style: TextStyle(fontSize: 15)),
                          Text('• Practices: SDLC, Code Review, Testing & Debugging', style: TextStyle(fontSize: 15)),
                          Text('• Soft Skills: Critical Thinking, Leadership, Adaptability', style: TextStyle(fontSize: 15)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 60),
                    const Center(
                      child: Text(
                        'Built with Flutter Web by Majid Bhuiyan',
                        style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
