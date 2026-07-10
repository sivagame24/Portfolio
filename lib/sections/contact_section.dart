// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app.dart';
import '../widgets/section_wrapper.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isWide = w > 800;

    return Container(
      color: AppColors.surface.withOpacity(0.4),
      child: SectionWrapper(
        title: 'Contact',
        child: Column(
          children: [
            Text(
              "Let's work together or just say hello!",
              style: GoogleFonts.notoSerif(
                fontSize: 20,
                color: AppColors.textSecondary,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 48),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                _ContactCard(
                  icon: Icons.mail_outline_rounded,
                  label: 'Email',
                  value: 'siva2003parthiban@gmail.com',
                  color: const Color(0xFF4F8EF7),
                  onTap: () => launchUrl(Uri.parse('mailto:siva2003parthiban@gmail.com')),
                ),
                _ContactCard(
                  icon: Icons.phone_outlined,
                  label: 'Phone',
                  value: '+91 9363484621',
                  color: const Color(0xFF22C55E),
                  onTap: () => launchUrl(Uri.parse('tel:+919363484621')),
                ),
                _ContactCard(
                  icon: Icons.link_rounded,
                  label: 'LinkedIn',
                  value: 'linkedin.com/in/sivagame-p',
                  color: const Color(0xFF0A66C2),
                  onTap: () => launchUrl(Uri.parse('https://www.linkedin.com/in/sivagame-p')),
                ),
                _ContactCard(
                  icon: Icons.code_rounded,
                  label: 'GitHub',
                  value: 'github.com/sivagame24',
                  color: const Color(0xFF8B5CF6),
                  onTap: () => launchUrl(Uri.parse('https://github.com/sivagame24')),
                ),
              ],
            ),
            const SizedBox(height: 80),
            // Footer
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 40, height: 1, color: AppColors.border),
                    const SizedBox(width: 16),
                    Text(
                      'SP',
                      style: GoogleFonts.notoSerif(
                        fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(width: 40, height: 1, color: AppColors.border),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Built with Flutter Web  •  Sivagame P  •  2026',
                  style: GoogleFonts.sourceCodePro(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final VoidCallback onTap;
  const _ContactCard({
    required this.icon, required this.label, required this.value,
    required this.color, required this.onTap,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 250,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.card : AppColors.card.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered ? widget.color.withOpacity(0.5) : AppColors.border,
            ),
            boxShadow: _hovered
                ? [BoxShadow(color: widget.color.withOpacity(0.1), blurRadius: 20)]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(widget.icon, size: 20, color: widget.color),
              ),
              const SizedBox(height: 12),
              Text(widget.label,
                style: GoogleFonts.sourceCodePro(fontSize: 11, color: AppColors.textSecondary, letterSpacing: 1)),
              const SizedBox(height: 4),
              Text(widget.value,
                style: GoogleFonts.notoSerif(fontSize: 13, color: AppColors.textPrimary, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
