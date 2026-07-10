import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app.dart';
import '../widgets/section_wrapper.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface.withOpacity(0.4),
      child: SectionWrapper(
        title: 'Work Experience',
        child: Column(
          children: const [
            _ExperienceCard(
              title: 'Mobile App Development Intern',
              company: 'Barbikan Technologies Pvt. Ltd.',
              location: 'Virudhunagar, Tamil Nadu',
              duration: 'December 2025 – May 2026',
              isCurrent: false,
              points: [
                'Developing cross-platform mobile applications for Android and iOS using Flutter and Dart in a professional production environment.',
                'Building and integrating backend REST APIs using Node.js and Express.js, connected to MySQL via structured schema design.',
                'Implementing JWT-based authentication and Role-Based Access Control (RBAC) for secure multi-role user management.',
                'Documenting and testing APIs using Swagger and Postman, ensuring endpoint reliability and team-wide clarity.',
                'Collaborating in Agile sprint workflows, participating in requirement discussions, and managing code via Git and GitHub Desktop.',
                'Contributing across the full SDLC — from requirement gathering and design through development, testing, and deployment.',
              ],
              tags: ['Flutter', 'Dart', 'Node.js', 'Express.js', 'MySQL', 'JWT', 'RBAC', 'Swagger'],
            ),
            SizedBox(height: 24),
            _ExperienceCard(
              title: 'Web Development Intern',
              company: 'CoolDreamers Software Solution',
              location: 'Sivakasi, Tamil Nadu',
              duration: 'May 2023 – June 2023',
              isCurrent: false,
              points: [
                'Developed and maintained responsive web pages using HTML5 and CSS3 for a business management platform.',
                'Designed user-friendly layouts for item category management, order processing, and delivery tracking screens.',
                'Improved cross-device UI consistency, gaining practical hands-on front-end development experience.',
              ],
              tags: ['HTML5', 'CSS3', 'Responsive Design', 'UI/UX'],
            ),
          ],
        ),
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final String title;
  final String company;
  final String location;
  final String duration;
  final bool isCurrent;
  final List<String> points;
  final List<String> tags;

  const _ExperienceCard({
    required this.title,
    required this.company,
    required this.location,
    required this.duration,
    required this.isCurrent,
    required this.points,
    required this.tags,
  });

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isWide = w > 700;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.card : AppColors.card.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered ? AppColors.accent.withOpacity(0.4) : AppColors.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildLeft()),
                      const SizedBox(width: 16),
                      _buildRight(),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [_buildLeft(), const SizedBox(height: 8), _buildRight()],
                  ),
            const SizedBox(height: 20),
            // Points
            ...widget.points.map((p) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Container(
                          width: 5, height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.accent,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          p,
                          style: GoogleFonts.notoSerif(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                            height: 1.7,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 16),
            // Tags
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: widget.tags
                  .map((t) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.accent.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.accent.withOpacity(0.2)),
                        ),
                        child: Text(
                          t,
                          style: GoogleFonts.sourceCodePro(fontSize: 11, color: AppColors.accent),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeft() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: GoogleFonts.notoSerif(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            if (widget.isCurrent) ...[
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF22C55E).withOpacity(0.12),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFF22C55E).withOpacity(0.3)),
                ),
                child: Text(
                  'Current',
                  style: GoogleFonts.sourceCodePro(fontSize: 10, color: const Color(0xFF22C55E)),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 4),
        Text(
          '${widget.company}  •  ${widget.location}',
          style: GoogleFonts.notoSerif(fontSize: 14, color: AppColors.accent),
        ),
      ],
    );
  }

  Widget _buildRight() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        widget.duration,
        style: GoogleFonts.sourceCodePro(
          fontSize: 12,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
