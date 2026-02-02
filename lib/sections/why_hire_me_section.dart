import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_theme.dart';

class WhyHireMeSection extends StatelessWidget {
  const WhyHireMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.background,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 100.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Section Header
              Column(
                children: [
                  Text(
                    "Why Work With Me?",
                    style: GoogleFonts.outfit(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: -1,
                    ),
                  ).animate().fadeIn(duration: const Duration(milliseconds: 600)).slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 16),
                  Container(
                    height: 4,
                    width: 60,
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ).animate().fadeIn(delay: const Duration(milliseconds: 200)).scaleX(begin: 0, end: 1),
                  const SizedBox(height: 24),
                  Text(
                    "Delivering value through technical excellence and dedication",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      color: AppTheme.textSecondary,
                      fontWeight: FontWeight.w400,
                    ),
                  ).animate().fadeIn(delay: const Duration(milliseconds: 400)),
                ],
              ),
              const SizedBox(height: 80),
              
              Wrap(
                spacing: 32,
                runSpacing: 32,
                alignment: WrapAlignment.center,
                children: [
                  _ReasonCard(
                    icon: Icons.bolt_rounded,
                    title: "Fast Learner",
                    description: "Quickly adapting to new ecosystems and delivering results with efficiency.",
                    delay: 200,
                  ),
                  _ReasonCard(
                    icon: Icons.auto_awesome_rounded,
                    title: "Clean Code",
                    description: "Prioritizing maintainability and scalability in every line of code.",
                    delay: 400,
                  ),
                  _ReasonCard(
                    icon: Icons.psychology_rounded,
                    title: "Problem Solver",
                    description: "Turning complex technical challenges into elegant solutions.",
                    delay: 600,
                  ),
                  _ReasonCard(
                    icon: Icons.groups_rounded,
                    title: "Collaborative",
                    description: "Focused on clear communication and successful team integration.",
                    delay: 800,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReasonCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final int delay;

  const _ReasonCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.delay,
  });

  @override
  State<_ReasonCard> createState() => _ReasonCardState();
}

class _ReasonCardState extends State<_ReasonCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 260,
        height: 280,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppTheme.surface.withValues(alpha: _isHovered ? 0.8 : 0.4),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _isHovered ? AppTheme.primary.withValues(alpha: 0.5) : Colors.white.withValues(alpha: 0.05),
            width: 1.5,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: AppTheme.primary.withValues(alpha: 0.1),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: 48,
              color: _isHovered ? AppTheme.primary : AppTheme.textSecondary,
            ),
            const SizedBox(height: 24),
            Text(
              widget.title,
              style: GoogleFonts.outfit(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              widget.description,
              style: GoogleFonts.outfit(
                fontSize: 14,
                color: AppTheme.textSecondary,
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: Duration(milliseconds: widget.delay)).slideY(begin: 0.1, end: 0);
  }
}
