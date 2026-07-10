import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'app.dart';
import 'widgets/nav_bar.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';
import 'sections/education_section.dart';
import 'sections/certifications_section.dart';
import 'sections/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(8, (_) => GlobalKey());
  int _activeSection = 0;
  bool _scrolled = false;

  final List<String> _navItems = [
    'Home', 'About', 'Skills', 'Experience', 'Projects', 'Education', 'Certifications', 'Contact'
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    if (offset > 60 && !_scrolled) setState(() => _scrolled = true);
    if (offset <= 60 && _scrolled) setState(() => _scrolled = false);

    for (int i = _sectionKeys.length - 1; i >= 0; i--) {
      final ctx = _sectionKeys[i].currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null) continue;
      final pos = box.localToGlobal(Offset.zero);
      if (pos.dy <= 120) {
        if (_activeSection != i) setState(() => _activeSection = i);
        break;
      }
    }
  }

  void scrollTo(int index) {
    final ctx = _sectionKeys[index].currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(ctx,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutCubic);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(
        children: [
          // Background grid pattern
          Positioned.fill(child: _buildBgGrid()),

          // Main scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(key: _sectionKeys[0], child: HeroSection(onViewProjects: () => scrollTo(4))),
                SizedBox(key: _sectionKeys[1], child: const AboutSection()),
                SizedBox(key: _sectionKeys[2], child: const SkillsSection()),
                SizedBox(key: _sectionKeys[3], child: const ExperienceSection()),
                SizedBox(key: _sectionKeys[4], child: const ProjectsSection()),
                SizedBox(key: _sectionKeys[5], child: const EducationSection()),
                SizedBox(key: _sectionKeys[6], child: const CertificationsSection()),
                SizedBox(key: _sectionKeys[7], child: const ContactSection()),
              ],
            ),
          ),

          // Navbar overlay
          Positioned(
            top: 0, left: 0, right: 0,
            child: NavBar(
              items: _navItems,
              activeIndex: _activeSection,
              scrolled: _scrolled,
              onTap: scrollTo,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBgGrid() {
    return CustomPaint(painter: _GridPainter());
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1E2D45).withOpacity(0.25)
      ..strokeWidth = 0.5;

    const spacing = 60.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) => false;
}
