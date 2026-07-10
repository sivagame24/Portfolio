import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app.dart';

class SectionWrapper extends StatelessWidget {
  final String title;
  final Widget child;
  final Color? bg;

  const SectionWrapper({
    super.key,
    required this.title,
    required this.child,
    this.bg,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = w > 1200 ? (w - 1100) / 2 : w > 700 ? 48.0 : 20.0;

    return Container(
      color: bg ?? Colors.transparent,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(title: title),
          const SizedBox(height: 48),
          child,
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '// ${title.toLowerCase()}',
          style: GoogleFonts.sourceCodePro(
            fontSize: 13,
            color: AppColors.accent,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.notoSerif(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Container(width: 48, height: 3, color: AppColors.accent),
            const SizedBox(width: 6),
            Container(width: 12, height: 3, color: AppColors.accentGold),
          ],
        ),
      ],
    );
  }
}

class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;
  final bool hoverable;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.hoverable = true,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) { if (widget.hoverable) setState(() => _hovered = true); },
      onExit: (_) { if (widget.hoverable) setState(() => _hovered = false); },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: widget.padding ?? const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.card.withOpacity(0.9) : AppColors.card.withOpacity(0.6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered ? AppColors.accent.withOpacity(0.4) : AppColors.border,
            width: 1,
          ),
          boxShadow: _hovered
              ? [BoxShadow(color: AppColors.accent.withOpacity(0.08), blurRadius: 24, spreadRadius: 2)]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}
