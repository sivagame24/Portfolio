import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app.dart';
import '../widgets/section_wrapper.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const _projects = [
    _Project(
      title: 'Construction Management System',
      subtitle: 'Mobile App',
      year: '2025–2026',
      role: 'Frontend Developer',
      tech: ['Flutter', 'Dart', 'Node.js', 'Express.js', 'MySQL'],
      desc: 'A mobile application for managing construction site operations including task scheduling, progress tracking, and resource allocation with RBAC for admin, supervisor, and worker roles.',
      icon: Icons.construction_rounded,
      color: Color(0xFFE8B84B),
    ),
    _Project(
      title: 'Jewellery Shop Inventory',
      subtitle: 'Management System',
      year: '2025–2026',
      role: 'Frontend Developer',
      tech: ['Flutter', 'Dart', 'Node.js', 'Express.js', 'MySQL'],
      desc: 'Cross-platform mobile app for jewellery shop inventory tracking, stock management, and sales reporting with JWT authentication and structured MySQL schema.',
      icon: Icons.diamond_rounded,
      color: Color(0xFFEC4899),
    ),
    _Project(
      title: 'Traders Association',
      subtitle: 'Mobile Application',
      year: '2025–2026',
      role: 'Frontend Developer',
      tech: ['Flutter', 'Dart', 'Node.js', 'MySQL', 'Localization'],
      desc: 'Mobile platform for traders association members to manage registrations, announcements, and event communications. Features Tamil default localization with English switching and push notifications.',
      icon: Icons.store_rounded,
      color: Color(0xFF22C55E),
    ),
    _Project(
      title: 'Task Management',
      subtitle: 'Mobile Application',
      year: '2025–2026',
      role: 'Full Stack Developer',
      tech: ['Flutter', 'Dart', 'Node.js', 'Express.js', 'MySQL'],
      desc: 'Task management app supporting task creation, assignment, status tracking, and deadline notifications with modular UI and multi-user collaborative workflows.',
      icon: Icons.task_alt_rounded,
      color: Color(0xFF8B5CF6),
    ),
    _Project(
      title: 'Real-Time Chat',
      subtitle: 'Application',
      year: '2025',
      role: 'Full Stack Developer',
      tech: ['Flutter', 'Dart', 'Android Studio', 'Google Cloud Firestore'],
      desc: 'Real-time messaging application supporting instant message delivery between users. Built with Google Cloud Firestore for scalable cloud storage and real-time message synchronization.',
      icon: Icons.chat_bubble_rounded,
      color: Color(0xFF4F8EF7),
    ),
    _Project(
      title: 'Real Estate E-Commerce',
      subtitle: 'Website',
      year: '2024',
      role: 'Full Stack Developer',
      tech: ['PHP', 'MySQL', 'HTML', 'CSS'],
      desc: 'Full-featured property listing platform enabling users to browse, list, and enquire about real estate properties with dynamic pages and normalized relational database schema.',
      icon: Icons.home_rounded,
      color: Color(0xFFF97316),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = w > 1000 ? 3 : w > 600 ? 2 : 1;

    return SectionWrapper(
      title: 'Projects',
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: cols,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: w > 1000 ? 1.05 : 0.95,
        ),
        itemCount: _projects.length,
        itemBuilder: (_, i) => _ProjectCard(project: _projects[i]),
      ),
    );
  }
}

class _Project {
  final String title;
  final String subtitle;
  final String year;
  final String role;
  final List<String> tech;
  final String desc;
  final IconData icon;
  final Color color;
  const _Project({
    required this.title, required this.subtitle, required this.year,
    required this.role, required this.tech, required this.desc,
    required this.icon, required this.color,
  });
}

class _ProjectCard extends StatefulWidget {
  final _Project project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.card : AppColors.card.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered ? p.color.withOpacity(0.45) : AppColors.border,
          ),
          boxShadow: _hovered
              ? [BoxShadow(color: p.color.withOpacity(0.08), blurRadius: 24, spreadRadius: 2)]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: p.color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(p.icon, size: 20, color: p.color),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.bg,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Text(
                    p.year,
                    style: GoogleFonts.sourceCodePro(fontSize: 11, color: AppColors.textSecondary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              p.title,
              style: GoogleFonts.notoSerif(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              p.subtitle,
              style: GoogleFonts.notoSerif(fontSize: 13, color: p.color),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.08),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                p.role,
                style: GoogleFonts.sourceCodePro(fontSize: 10, color: AppColors.accent, letterSpacing: 0.5),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                p.desc,
                style: GoogleFonts.notoSerif(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  height: 1.65,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              children: p.tech.map((t) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.bg,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(t, style: GoogleFonts.sourceCodePro(fontSize: 10, color: AppColors.textSecondary)),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
