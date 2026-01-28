import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/app_constants.dart';
import '../core/app_theme.dart';
import '../widgets/responsive_layout.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onSeeProjects;

  const HeroSection({
    super.key,
    required this.onSeeProjects,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.background,
            Color(0xFF2C3E50), // Slightly lighter
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
        child: ResponsiveLayout(
          mobile: _buildContent(context, centered: true),
          desktop: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Row(
                children: [
                  Expanded(child: _buildContent(context, centered: false)),
                  if (ResponsiveLayout.isDesktop(context))
                    Expanded(child: _buildIllustration()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, {required bool centered}) {
    final align = centered ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final textAlign = centered ? TextAlign.center : TextAlign.left;

    return Column(
      crossAxisAlignment: align,
      children: [
        Text(
          AppConstants.headline,
          textAlign: textAlign,
          style: GoogleFonts.poppins(
            fontSize: centered ? 32 : 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0),
        const SizedBox(height: 16),
        Text(
          AppConstants.subHeadline,
          textAlign: textAlign,
          style: GoogleFonts.inter(
            fontSize: 18,
            color: AppTheme.primary,
            fontWeight: FontWeight.w500,
          ),
        ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1, end: 0),
        const SizedBox(height: 24),
        Text(
          AppConstants.intro,
          textAlign: textAlign,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.grey[400],
            height: 1.5,
          ),
        ).animate().fadeIn(delay: 400.ms),
        const SizedBox(height: 32),
        Wrap(
          alignment: centered ? WrapAlignment.center : WrapAlignment.start,
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO: Add resume download logic
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              ),
              child: const Text("Download Resume"),
            ),
            OutlinedButton(
              onPressed: onSeeProjects,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                foregroundColor: AppTheme.primary,
                side: const BorderSide(color: AppTheme.primary),
              ),
              child: const Text("View Projects"),
            ),
          ],
        ).animate().fadeIn(delay: 600.ms).scale(),
      ],
    );
  }

  Widget _buildIllustration() {
    // Placeholder for 3D illustration or image
    return Center(
      child: Container(
        height: 400,
        width: 400,
        decoration: BoxDecoration(
          color: AppTheme.surface.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.code,
          size: 150,
          color: AppTheme.primary,
        ),
      ).animate().fadeIn(delay: 800.ms).scale(),
    );
  }
}
