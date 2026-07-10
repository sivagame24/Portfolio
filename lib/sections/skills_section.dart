import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app.dart';
import '../widgets/section_wrapper.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const _categories = [
    _SkillCategory(
      icon: Icons.code_rounded,
      title: 'Languages',
      skills: ['Dart', 'JavaScript', 'PHP', 'C', 'C++'],
    ),
    _SkillCategory(
      icon: Icons.phone_android_rounded,
      title: 'Frontend / Mobile',
      skills: ['Flutter', 'HTML5', 'CSS3', 'Cross-platform Dev'],
    ),
    _SkillCategory(
      icon: Icons.dns_rounded,
      title: 'Backend',
      skills: ['Node.js', 'Express.js', 'REST API', 'SDLC'],
    ),
    _SkillCategory(
      icon: Icons.storage_rounded,
      title: 'Database',
      skills: ['MySQL', 'MySQL Workbench', 'Schema Design'],
    ),
    _SkillCategory(
      icon: Icons.security_rounded,
      title: 'Auth & Security',
      skills: ['JWT', 'RBAC', 'Multi-role Management'],
    ),
    _SkillCategory(
      icon: Icons.build_rounded,
      title: 'Tools & Workflow',
      skills: ['Postman', 'Swagger', 'GitHub Desktop', 'Android Studio', 'Google Cloud', 'Agile'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = w > 1000 ? 3 : w > 600 ? 2 : 1;

    return SectionWrapper(
      title: 'Technical Skills',
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: cols,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: w > 1000 ? 1.6 : 1.8,
        ),
        itemCount: _categories.length,
        itemBuilder: (_, i) => _SkillCard(category: _categories[i]),
      ),
    );
  }
}

class _SkillCategory {
  final IconData icon;
  final String title;
  final List<String> skills;
  const _SkillCategory({required this.icon, required this.title, required this.skills});
}

class _SkillCard extends StatefulWidget {
  final _SkillCategory category;
  const _SkillCard({required this.category});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.card : AppColors.card.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered ? AppColors.accent.withOpacity(0.45) : AppColors.border,
          ),
          boxShadow: _hovered
              ? [BoxShadow(color: AppColors.accent.withOpacity(0.07), blurRadius: 20)]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(widget.category.icon, size: 18, color: AppColors.accent),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    widget.category.title,
                    style: GoogleFonts.notoSerif(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: widget.category.skills.map((s) => _Chip(label: s)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  const _Chip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        label,
        style: GoogleFonts.sourceCodePro(
          fontSize: 11,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
