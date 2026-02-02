import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/app_constants.dart';
import '../core/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.background,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 100.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            children: [
              // Section Header
              Column(
                children: [
                  Text(
                    "About Me",
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
              const SizedBox(height: 60),
              
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: AppTheme.surface.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
                ),
                child: Column(
                  children: [
                    Text(
                      AppConstants.aboutMe,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 20,
                        color: AppTheme.textPrimary.withValues(alpha: 0.9),
                        height: 1.8,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 48),
                    _buildStatsGrid(),
                  ],
                ),
              ).animate().fadeIn(delay: const Duration(milliseconds: 400)).slideY(begin: 0.1, end: 0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsGrid() {
    return Wrap(
      spacing: 40,
      runSpacing: 40,
      alignment: WrapAlignment.center,
      children: [
        _buildStatItem("1+", "Years Experience"),
        _buildStatItem("3+", "Projects Completed"),
        _buildStatItem("5+", "Tech Stacks"),
      ],
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.outfit(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: AppTheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 14,
            color: AppTheme.textSecondary,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
