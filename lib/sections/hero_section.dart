import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjects;
  const HeroSection({super.key, required this.onViewProjects});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1200 ? (w - 1100) / 2 : w > 700 ? 48.0 : 20.0;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
      padding: EdgeInsets.fromLTRB(hPad, 120, hPad, 80),
      child: Stack(
        children: [
          // Glow blob
          Positioned(
            top: -60, right: -40,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.accent.withOpacity(0.12),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBadge(),
              const SizedBox(height: 24),
              _buildName(),
              const SizedBox(height: 16),
              _buildAnimatedRole(),
              const SizedBox(height: 24),
              _buildSummary(),
              const SizedBox(height: 40),
              _buildButtons(),
              const SizedBox(height: 60),
              _buildStats(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.accent.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7, height: 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF22C55E),
              boxShadow: [BoxShadow(color: const Color(0xFF22C55E).withOpacity(0.6), blurRadius: 6)],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Open to Work',
            style: GoogleFonts.sourceCodePro(
              fontSize: 12,
              color: AppColors.accent,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildName() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Sivagame ',
            style: GoogleFonts.notoSerif(
              fontSize: 64,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
              height: 1.05,
            ),
          ),
          TextSpan(
            text: 'P',
            style: GoogleFonts.notoSerif(
              fontSize: 64,
              fontWeight: FontWeight.w700,
              color: AppColors.accent,
              height: 1.05,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedRole() {
    return Row(
      children: [
        Text(
          '< ',
          style: GoogleFonts.sourceCodePro(
            fontSize: 22,
            color: AppColors.accentGold,
          ),
        ),
        AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TypewriterAnimatedText(
              'Full Stack Developer',
              textStyle: GoogleFonts.notoSerif(
                fontSize: 22,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w400,
              ),
              speed: const Duration(milliseconds: 80),
            ),
            TypewriterAnimatedText(
              'Mobile App Developer',
              textStyle: GoogleFonts.notoSerif(
                fontSize: 22,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w400,
              ),
              speed: const Duration(milliseconds: 80),
            ),
            TypewriterAnimatedText(
              'Flutter & Dart Enthusiast',
              textStyle: GoogleFonts.notoSerif(
                fontSize: 22,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w400,
              ),
              speed: const Duration(milliseconds: 80),
            ),
          ],
        ),
        Text(
          ' />',
          style: GoogleFonts.sourceCodePro(
            fontSize: 22,
            color: AppColors.accentGold,
          ),
        ),
      ],
    );
  }

  Widget _buildSummary() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: Text(
        'Fresher Full Stack & Mobile Application Developer with 6 months of professional internship experience. Strong foundation in Flutter, Node.js, Express.js, and MySQL. Passionate about clean, scalable code and user-friendly applications.',
        style: GoogleFonts.notoSerif(
          fontSize: 16,
          color: AppColors.textSecondary,
          height: 1.8,
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Wrap(
      spacing: 16,
      runSpacing: 12,
      children: [
        _HeroButton(
          label: 'View Projects',
          isPrimary: true,
          icon: Icons.code_rounded,
          onTap: onViewProjects,
        ),
        _HeroButton(
          label: 'GitHub',
          isPrimary: false,
          icon: Icons.open_in_new_rounded,
          onTap: () => launchUrl(Uri.parse('https://github.com/sivagame24')),
        ),
        _HeroButton(
          label: 'LinkedIn',
          isPrimary: false,
          icon: Icons.person_rounded,
          onTap: () => launchUrl(Uri.parse('https://www.linkedin.com/in/sivagame-p')),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Wrap(
      spacing: 32,
      runSpacing: 16,
      children: const [
        _StatItem(value: '6+', label: 'Months Experience'),
        _StatItem(value: '6', label: 'Projects Built'),
        _StatItem(value: '4', label: 'Certifications'),
        _StatItem(value: '8.81', label: 'MCA CGPA'),
      ],
    );
  }
}

class _HeroButton extends StatefulWidget {
  final String label;
  final bool isPrimary;
  final IconData icon;
  final VoidCallback onTap;

  const _HeroButton({
    required this.label,
    required this.isPrimary,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_HeroButton> createState() => _HeroButtonState();
}

class _HeroButtonState extends State<_HeroButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: widget.isPrimary
                ? (_hovered ? AppColors.accent : AppColors.accent.withOpacity(0.85))
                : (_hovered ? AppColors.card : Colors.transparent),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.isPrimary ? AppColors.accent : AppColors.border,
              width: 1,
            ),
            boxShadow: widget.isPrimary && _hovered
                ? [BoxShadow(color: AppColors.accent.withOpacity(0.3), blurRadius: 20)]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon,
                  size: 16,
                  color: widget.isPrimary ? Colors.white : AppColors.textSecondary),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: GoogleFonts.notoSerif(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: widget.isPrimary ? Colors.white : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.notoSerif(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: AppColors.accent,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.notoSerif(
            fontSize: 13,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
