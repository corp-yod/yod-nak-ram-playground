import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BoardPage();
  }
}

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9EAF3),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Board",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.tune, color: Colors.grey[700]),
                ],
              ),
            ),

            // Grid Content
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFFE9EAF3),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1,
                  children: const [
                    BoardCard(
                      icon: Icons.person_outline,
                      title: "Personal",
                      subtitle: "17 Task",
                      iconColor: Colors.indigo,
                    ),
                    BoardCard(
                      icon: Icons.card_giftcard,
                      title: "Work",
                      subtitle: "10 Task",
                      iconColor: Colors.redAccent,
                    ),
                    BoardCard(
                      icon: Icons.lock_outline,
                      title: "Private",
                      subtitle: "2 Task",
                      iconColor: Colors.teal,
                    ),
                    BoardCard(
                      icon: Icons.groups_outlined,
                      title: "Meeting",
                      subtitle: "5 Task",
                      iconColor: Colors.indigo,
                    ),
                    BoardCard(
                      icon: Icons.event,
                      title: "Events",
                      subtitle: "3 Task",
                      iconColor: Colors.deepOrange,
                    ),
                    BoardCard(
                      icon: Icons.add,
                      title: "Create Board",
                      subtitle: "",
                      iconColor: Colors.teal,
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Navigation
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}

class BoardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  const BoardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          if (subtitle.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF5B4BDB), Color(0xFF6A5AE0)],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.grid_view, color: Colors.white70),
                  Icon(Icons.folder_open, color: Colors.white70),
                  SizedBox(width: 40),
                  Icon(Icons.pie_chart_outline, color: Colors.white70),
                  Icon(Icons.chat_bubble_outline, color: Colors.white70),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              height: 55,
              width: 55,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
