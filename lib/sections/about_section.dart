import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app.dart';
import '../widgets/section_wrapper.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isWide = w > 800;

    return Container(color: AppColors.surface.withOpacity(0.4),
      child: SectionWrapper(
        title: 'About Me',
        child: isWide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: _buildText()),
                  const SizedBox(width: 48),
                  Expanded(flex: 2, child: _buildInfoCard()),
                ],
              )
            : Column(
                children: [
                  _buildText(),
                  const SizedBox(height: 32),
                  _buildInfoCard(),
                ],
              ),
      ),
    );
  }

  Widget _buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fresher Full Stack & Mobile Application Developer',
          style: GoogleFonts.notoSerif(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'I have 6 months of professional internship experience, contributing to real-world production projects in mobile and backend domains. My work spans Flutter mobile apps, Node.js REST APIs, and MySQL database design.',
          style: GoogleFonts.notoSerif(
            fontSize: 15,
            color: AppColors.textSecondary,
            height: 1.9,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'I am passionate about writing clean, scalable code and building user-friendly applications. I thrive in Agile environments and enjoy contributing across the full SDLC — from requirement gathering to deployment.',
          style: GoogleFonts.notoSerif(
            fontSize: 15,
            color: AppColors.textSecondary,
            height: 1.9,
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: ['Flutter', 'Dart', 'Node.js', 'MySQL', 'REST APIs', 'JWT', 'RBAC']
              .map((s) => _Tag(label: s))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildInfoCard() {
    return const GlassCard(
      hoverable: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoRow(icon: Icons.location_on_rounded, label: 'Location', value: 'Sivakasi, Tamil Nadu'),
          Divider(color: AppColors.border, height: 24),
          _InfoRow(icon: Icons.mail_rounded, label: 'Email', value: 'siva2003parthiban@gmail.com'),
          Divider(color: AppColors.border, height: 24),
          _InfoRow(icon: Icons.phone_rounded, label: 'Phone', value: '+91 9363484621'),
          Divider(color: AppColors.border, height: 24),
          _InfoRow(icon: Icons.school_rounded, label: 'Degree', value: 'MCA – Mepco Schlenk Engineering College'),
          Divider(color: AppColors.border, height: 24),
          _InfoRow(icon: Icons.work_rounded, label: 'Status', value: 'Open to Work'),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _InfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.accent),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: GoogleFonts.sourceCodePro(fontSize: 10, color: AppColors.textSecondary, letterSpacing: 1)),
            const SizedBox(height: 2),
            Text(value, style: GoogleFonts.notoSerif(fontSize: 13, color: AppColors.textPrimary)),
          ],
        ),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;
  const _Tag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.accent.withOpacity(0.25)),
      ),
      child: Text(
        label,
        style: GoogleFonts.sourceCodePro(fontSize: 12, color: AppColors.accent),
      ),
    );
  }
}
