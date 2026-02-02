import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_theme.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.background,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 100.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              // Section Header
              Column(
                children: [
                  Text(
                    "Professional Journey",
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
                ],
              ),
              const SizedBox(height: 80),
              
              _buildTimelineItem(
                title: "Flutter Developer Intern",
                company: "Brototype",
                duration: "2024 - Present",
                description:
                    "Intensive training in Flutter & Dart. Built real-world applications with Firebase, Hive, and REST APIs. Mastered clean architecture and state management.",
                isLast: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String company,
    required String duration,
    required String description,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimelineIndicator(isLast),
          const SizedBox(width: 32),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 48),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppTheme.surface.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          style: GoogleFonts.outfit(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          duration,
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            color: AppTheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    company,
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      color: AppTheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    description,
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      color: AppTheme.textSecondary,
                      height: 1.6,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: const Duration(milliseconds: 400)).slideX(begin: 0.1, end: 0),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineIndicator(bool isLast) {
    return Column(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: AppTheme.background,
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.primary, width: 4),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primary.withValues(alpha: 0.3),
                blurRadius: 10,
              ),
            ],
          ),
        ),
        if (!isLast)
          Expanded(
            child: Container(
              width: 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppTheme.primary,
                    AppTheme.primary.withValues(alpha: 0.1),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
