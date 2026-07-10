import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app.dart';
import '../widgets/section_wrapper.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  static const _edu = [
    _EduItem(
      degree: 'Master of Computer Applications',
      short: 'MCA',
      institution: 'Mepco Schlenk Engineering College',
      location: 'Sivakasi, Tamil Nadu',
      year: '2024 – 2026',
      score: 'CGPA: 8.81',
      icon: Icons.school_rounded,
      isCurrent: false,
    ),
    _EduItem(
      degree: 'Bachelor of Computer Applications',
      short: 'BCA',
      institution: 'Ayya Nadar Janaki Ammal College',
      location: 'Sivakasi, Tamil Nadu',
      year: '2021 – 2024',
      score: 'CGPA: 8.03',
      icon: Icons.menu_book_rounded,
      isCurrent: false,
    ),
    _EduItem(
      degree: 'Higher Secondary (HSLC)',
      short: 'XII',
      institution: 'S.H.N Higher Secondary School',
      location: 'Sivakasi, Tamil Nadu',
      year: '2020 – 2021',
      score: '84.3%',
      icon: Icons.class_rounded,
      isCurrent: false,
    ),
    _EduItem(
      degree: 'Secondary School (SSLC)',
      short: 'X',
      institution: 'S.H.N Higher Secondary School',
      location: 'Sivakasi, Tamil Nadu',
      year: '2018 – 2019',
      score: '79.8%',
      icon: Icons.auto_stories_rounded,
      isCurrent: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface.withOpacity(0.4),
      child: SectionWrapper(
        title: 'Education',
        child: Column(
          children: _edu.map((e) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _EduCard(item: e),
          )).toList(),
        ),
      ),
    );
  }
}

class _EduItem {
  final String degree, short, institution, location, year, score;
  final IconData icon;
  final bool isCurrent;
  const _EduItem({
    required this.degree, required this.short, required this.institution,
    required this.location, required this.year, required this.score,
    required this.icon, required this.isCurrent,
  });
}

class _EduCard extends StatefulWidget {
  final _EduItem item;
  const _EduCard({required this.item});

  @override
  State<_EduCard> createState() => _EduCardState();
}

class _EduCardState extends State<_EduCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final e = widget.item;
    final w = MediaQuery.of(context).size.width;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.card : AppColors.card.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _hovered ? AppColors.accent.withOpacity(0.4) : AppColors.border,
          ),
        ),
        child: w > 600
            ? Row(
                children: [
                  Container(
                    width: 52, height: 52,
                    decoration: BoxDecoration(
                      color: AppColors.accent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(e.icon, size: 18, color: AppColors.accent),
                        Text(e.short, style: GoogleFonts.sourceCodePro(fontSize: 9, color: AppColors.accent)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(e.degree,
                                style: GoogleFonts.notoSerif(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                            ),
                            if (e.isCurrent)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF22C55E).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: const Color(0xFF22C55E).withOpacity(0.3)),
                                ),
                                child: Text('Ongoing', style: GoogleFonts.sourceCodePro(fontSize: 10, color: const Color(0xFF22C55E))),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text('${e.institution}  •  ${e.location}',
                          style: GoogleFonts.notoSerif(fontSize: 13, color: AppColors.accent)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(e.year, style: GoogleFonts.sourceCodePro(fontSize: 12, color: AppColors.textSecondary)),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.accentGold.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.accentGold.withOpacity(0.3)),
                        ),
                        child: Text(e.score,
                          style: GoogleFonts.notoSerif(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.accentGold)),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(e.degree, style: GoogleFonts.notoSerif(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                  const SizedBox(height: 4),
                  Text(e.institution, style: GoogleFonts.notoSerif(fontSize: 13, color: AppColors.accent)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(e.year, style: GoogleFonts.sourceCodePro(fontSize: 11, color: AppColors.textSecondary)),
                      const Spacer(),
                      Text(e.score, style: GoogleFonts.notoSerif(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.accentGold)),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
