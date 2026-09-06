import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

const Color primaryBlue = Color(0xFF4657B8);
const Color darkBlue = Color(0xFF34458F);
const Color lightBlue = Color(0xFFE8EAF7);

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'T. Nitya Nissi',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryBlue,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlue,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Portfolio',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 75,
                  backgroundColor: Color(0xFFE9DEFF),
                  child: Icon(Icons.person, size: 80, color: primaryBlue),
                ),
                const SizedBox(height: 25),
                const Text(
                  'T. NITYA NISSI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: darkBlue,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'B.Tech 3rd Year • Computer Science',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutPage()),
                    ),
                    child: const Text('About Me', style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProjectsPage()),
                    ),
                    child: const Text('Projects', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: const Text('About Me', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Icon(Icons.info_outline, size: 60, color: primaryBlue),
                const SizedBox(height: 20),
                const Text(
                  "Hello! I'm T.Nitya Nissi, a passionate Computer Science student from CR Rao AIMSCS. I love exploring modern technologies and building creative digital projects.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, height: 1.6),
                ),
                const SizedBox(height: 30),
                const Text('Skills & Expertise', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: darkBlue)),
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: ['Python', 'Java', 'C', 'AI & ML', 'Flutter', 'LLM', 'RAG']
                      .map((s) => SkillBox(s))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SkillBox extends StatelessWidget {
  final String text;
  const SkillBox(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Text(text, style: const TextStyle(color: primaryBlue, fontWeight: FontWeight.bold)),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> projects = [
      {'title': 'Video to Text', 'desc': 'Converts video/audio to text using AI.', 'icon': Icons.mic},
      {'title': 'Pharmacy Management', 'desc': 'Inventory and billing system.', 'icon': Icons.local_pharmacy},
      {'title': 'Travel Guide', 'desc': 'Discover and plan your travel.', 'icon': Icons.travel_explore},
      {'title': 'LLM-Powered RAG', 'desc': 'Document Q&A using AI.', 'icon': Icons.psychology},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: const Text('My Projects', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final p = projects[index];
          return ProjectCard(title: p['title'], description: p['desc'], icon: p['icon']);
        },
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  const ProjectCard({super.key, required this.title, required this.description, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Icon(icon, color: primaryBlue, size: 30),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}
