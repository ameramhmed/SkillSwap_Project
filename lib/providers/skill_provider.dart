import 'package:flutter/material.dart';
import '../models/skill.dart';

class SkillProvider with ChangeNotifier {
  final List<Skill> _items = [
    Skill(
      id: '1',
      title: 'UI/UX Design',
      providerName: 'Amira',
      description: 'Design mobile apps',
      category: 'Design',
    ),
    Skill(
      id: '2',
      title: 'Flutter Development',
      providerName: 'Ahmed',
      description: 'Coding apps',
      category: 'Programming',
    ),
    Skill(
      id: '3',
      title: 'Graphic Design',
      providerName: 'Noor',
      description: 'Adobe Photoshop',
      category: 'Art',
    ),
    Skill(
      id: 's4',
      title: 'Content Writing',
      providerName: 'Zainab',
      description: 'Learn the art of storytelling.',
      category: 'Writing',
    ),
  ];

  List<Skill> _filteredItems = [];
  bool _isDarkMode = false;

  SkillProvider() {
    _filteredItems = _items;
  }

  List<Skill> get items => _filteredItems;
  bool get isDarkMode => _isDarkMode;

  void searchSkills(String query) {
    if (query.isEmpty) {
      _filteredItems = _items;
    } else {
      _filteredItems = _items
          .where(
            (skill) => skill.title.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
    notifyListeners();
  }

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
