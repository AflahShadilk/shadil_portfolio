import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/app_theme.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
      child: Column(
        children: [
          Text(
            "Experience",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppTheme.primary,
            ),
          ),
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: _buildExperienceItem(
              title: "Flutter Developer Intern",
              company: "Brototype",
              duration: "1 Year",
              description:
                  "• Hands-on training in Flutter & Dart.\n• Built real-world applications involving Firebase & offline storage.\n• Worked with REST APIs and state management.\n• Followed clean coding practices and architecture.",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem({
    required String title,
    required String company,
    required String duration,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: AppTheme.primary,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 2,
              height: 120, // Adjust based on content
              color: AppTheme.secondary,
            ),
          ],
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.building, size: 14, color: AppTheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    company,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppTheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const FaIcon(FontAwesomeIcons.clock, size: 14, color: AppTheme.textSecondary),
                  const SizedBox(width: 8),
                  Text(
                    duration,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppTheme.textPrimary.withOpacity(0.8),
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
