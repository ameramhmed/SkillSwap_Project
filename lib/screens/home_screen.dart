import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/skill_provider.dart';
import 'details_screen.dart';
import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final skillProvider = Provider.of<SkillProvider>(context);
    final isDark = skillProvider.isDarkMode;
    final skills = skillProvider.items;

    return Scaffold(
      body: Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: isDark
                            ? Colors.tealAccent
                            : Colors.teal.shade900,
                      ),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: SkillSearchDelegate(skills),
                        );
                      },
                    ),

                    Expanded(
                      child: Center(
                        child: Text(
                          'SkillSwap',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? Colors.tealAccent
                                : Colors.teal.shade900,
                            fontFamily: 'sans-serif',
                          ),
                        ),
                      ),
                    ),

                    IconButton(
                      icon: Icon(
                        Icons.info_outline,
                        color: isDark ? Colors.white70 : Colors.teal,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutScreen(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isDark ? Icons.light_mode : Icons.dark_mode,
                        color: isDark ? Colors.yellow : Colors.teal.shade900,
                      ),
                      onPressed: () => skillProvider.toggleDarkMode(),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, Amira! 👋',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.teal.shade800,
                        fontFamily: 'sans-serif',
                      ),
                    ),
                    Text(
                      'Explore skills to swap & grow',
                      style: TextStyle(
                        fontSize: 16,
                        color: isDark ? Colors.white60 : Colors.grey,
                        fontFamily: 'sans-serif',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: skills.length,
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(skill: skills[i]),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isDark ? Colors.grey[850] : Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: isDark
                                  ? Colors.black26
                                  : Colors.teal.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: isDark
                                  ? Colors.teal.shade900
                                  : Colors.teal.shade50,
                              child: Icon(
                                skills[i].title.contains('Design')
                                    ? Icons.brush
                                    : Icons.code,
                                color: isDark ? Colors.tealAccent : Colors.teal,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              skills[i].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white : Colors.black87,
                                fontFamily: 'sans-serif',
                              ),
                            ),
                            Text(
                              'Expert: ${skills[i].providerName}',
                              style: TextStyle(
                                fontSize: 12,
                                color: isDark ? Colors.white54 : Colors.grey,
                                fontFamily: 'sans-serif',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.teal,
        icon: const Icon(Icons.add),
        label: const Text(
          'Add Skill',
          style: TextStyle(fontFamily: 'sans-serif'),
        ),
      ),
    );
  }
}

class SkillSearchDelegate extends SearchDelegate {
  final List skills;

  SkillSearchDelegate(this.skills);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = skills
        .where((s) => s.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return _buildList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = skills
        .where((s) => s.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return _buildList(suggestions);
  }

  Widget _buildList(List results) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.teal.shade50, Colors.white, Colors.teal.shade100],
        ),
      ),
      child: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Icon(Icons.star, color: Colors.teal),
            title: Text(
              results[i].title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade900,
              ),
            ),
            subtitle: Text('Expert: ${results[i].providerName}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(skill: results[i]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
