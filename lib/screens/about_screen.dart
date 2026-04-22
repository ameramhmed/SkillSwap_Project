import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/skill_provider.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<SkillProvider>(context).isDarkMode;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [Colors.grey.shade900, Colors.black, Colors.grey.shade800]
                : [Colors.teal.shade50, Colors.white, Colors.teal.shade100],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: isDark ? Colors.tealAccent : Colors.teal,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    Text(
                      'Developer Profile',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? Colors.tealAccent
                            : Colors.teal.shade800,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 48),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[850] : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: isDark
                            ? Colors.black45
                            : Colors.teal.withValues(alpha: 0.1),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.teal.shade100,
                        child: const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Amira El-Shafie',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                      Text(
                        'UI/UX Designer & Flutter Developer',
                        style: TextStyle(
                          fontSize: 16,
                          color: isDark ? Colors.tealAccent : Colors.teal,
                        ),
                      ),
                      const Divider(height: 40),
                      Text(
                        'This app was developed with passion as part of the Internship Course, combining design aesthetics with Flutter power.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: isDark ? Colors.white70 : Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _socialIcon(Icons.link, isDark),
                          const SizedBox(width: 20),
                          _socialIcon(Icons.email_outlined, isDark),
                          const SizedBox(width: 20),
                          _socialIcon(Icons.camera_alt_outlined, isDark),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isDark ? Colors.teal.shade900 : Colors.teal.shade50,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: isDark ? Colors.tealAccent : Colors.teal,
        size: 20,
      ),
    );
  }
}
