import 'package:flutter/material.dart';
import 'info_card.dart';

class ExperienceItem extends StatelessWidget {
  final String role;
  final String company;
  final String duration;
  final String location;
  final String description;

  const ExperienceItem({
    super.key,
    required this.role,
    required this.company,
    required this.duration,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InfoCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    role,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Text(
                  duration,
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Text(
              '$company — $location',
              style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 10),
            Text(description, style: const TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
