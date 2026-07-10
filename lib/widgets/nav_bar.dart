import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app.dart';

class NavBar extends StatelessWidget {
  final List<String> items;
  final int activeIndex;
  final bool scrolled;
  final ValueChanged<int> onTap;

  const NavBar({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.scrolled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: scrolled ? AppColors.bg.withOpacity(0.92) : Colors.transparent,
        border: scrolled
            ? Border(bottom: BorderSide(color: AppColors.border, width: 1))
            : null,
        boxShadow: scrolled
            ? [BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 20)]
            : null,
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          child: Row(
            children: [
              // Logo
//               Text(
//   'SP',
//   style: GoogleFonts.notoSerif(
//     fontSize: 22,
//     fontWeight: FontWeight.w700,
//     color: AppColors.accent,
//     letterSpacing: 2,
//   ),
// ),
              GestureDetector(
                onTap: () => _showZoomedProfile(context),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.accent, width: 2),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              if (isWide)
                ...List.generate(
                    items.length,
                    (i) => _NavItem(
                          label: items[i],
                          isActive: activeIndex == i,
                          onTap: () => onTap(i),
                        ))
              else
                _MobileMenu(
                    items: items, activeIndex: activeIndex, onTap: onTap),
            ],
          ),
        ),
      ),
    );
  }
}

void _showZoomedProfile(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: 'Profile',
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.85),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) => const SizedBox.shrink(),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curved =
          CurvedAnimation(parent: animation, curve: Curves.easeOutBack);
      return Opacity(
        opacity: animation.value.clamp(0.0, 1.0),
        child: ScaleTransition(
          scale: curved,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Hero(
                  tag: 'profile-avatar',
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      width: 280,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

class _NavItem extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  const _NavItem(
      {required this.label, required this.isActive, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(left: 8),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: widget.isActive
                ? AppColors.accent.withOpacity(0.15)
                : _hovered
                    ? AppColors.accent.withOpacity(0.07)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: widget.isActive
                  ? AppColors.accent.withOpacity(0.5)
                  : Colors.transparent,
              width: 1,
            ),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.notoSerif(
              fontSize: 13,
              color:
                  widget.isActive ? AppColors.accent : AppColors.textSecondary,
              fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final List<String> items;
  final int activeIndex;
  final ValueChanged<int> onTap;
  const _MobileMenu(
      {required this.items, required this.activeIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.menu, color: AppColors.textPrimary),
      color: AppColors.card,
      onSelected: onTap,
      itemBuilder: (_) => List.generate(
        items.length,
        (i) => PopupMenuItem(
          value: i,
          child: Text(
            items[i],
            style: GoogleFonts.notoSerif(
              color:
                  i == activeIndex ? AppColors.accent : AppColors.textPrimary,
              fontWeight: i == activeIndex ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
