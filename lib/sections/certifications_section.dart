import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app.dart';
import '../widgets/section_wrapper.dart';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  static const _certs = [
    _Cert(
      title: 'Problem Solving in Java',
      issuer: 'HackerRank',
      icon: Icons.terminal_rounded,
      color: Color(0xFF22C55E),
    ),
    _Cert(
      title: 'Python for Data Science',
      issuer: 'NPTEL',
      icon: Icons.bar_chart_rounded,
      color: Color(0xFF4F8EF7),
    ),
    _Cert(
      title: 'Introduction to Internet of Things (IoT)',
      issuer: 'NPTEL',
      icon: Icons.devices_other_rounded,
      color: Color(0xFFE8B84B),
    ),
    _Cert(
      title: 'English for Technical Professionals',
      issuer: 'IEEE',
      icon: Icons.language_rounded,
      color: Color(0xFF8B5CF6),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final cols = w > 800 ? 2 : 1;

    return SectionWrapper(
      title: 'Certifications',
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: cols,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: w > 800 ? 3.5 : 4.0,
        ),
        itemCount: _certs.length,
        itemBuilder: (_, i) => _CertCard(cert: _certs[i]),
      ),
    );
  }
}

class _Cert {
  final String title, issuer;
  final IconData icon;
  final Color color;
  const _Cert({required this.title, required this.issuer, required this.icon, required this.color});
}

class _CertCard extends StatefulWidget {
  final _Cert cert;
  const _CertCard({required this.cert});

  @override
  State<_CertCard> createState() => _CertCardState();
}

class _CertCardState extends State<_CertCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final c = widget.cert;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.card : AppColors.card.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _hovered ? c.color.withOpacity(0.4) : AppColors.border,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: c.color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(c.icon, size: 20, color: c.color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(c.title,
                    style: GoogleFonts.notoSerif(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                  const SizedBox(height: 3),
                  Text(c.issuer,
                    style: GoogleFonts.sourceCodePro(fontSize: 12, color: c.color)),
                ],
              ),
            ),
            Icon(Icons.verified_rounded, size: 18, color: c.color.withOpacity(0.6)),
          ],
        ),
      ),
    );
  }
}
