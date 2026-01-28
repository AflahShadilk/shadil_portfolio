import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/app_theme.dart';

class WhyHireMeSection extends StatelessWidget {
  const WhyHireMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
      child: Column(
        children: [
          Text(
            "Why Hire Me?",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppTheme.primary,
            ),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: const [
              _ReasonCard(
                icon: FontAwesomeIcons.bolt,
                title: "Fast Learner",
                description: "Quickly adapt to new tech stacks & tools.",
              ),
              _ReasonCard(
                icon: FontAwesomeIcons.code,
                title: "Clean Code",
                description: "Write maintainable, scalable, and documented code.",
              ),
              _ReasonCard(
                icon: FontAwesomeIcons.lightbulb, // Updated Icon
                title: "Problem Solver",
                description: "Strong logical thinking and debugging skills.",
              ),
              _ReasonCard(
                icon: FontAwesomeIcons.users,
                title: "Team Player",
                description: "Effective communication and collaboration.",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ReasonCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ReasonCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primary.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          FaIcon(icon, size: 40, color: AppTheme.primary),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppTheme.textSecondary,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
