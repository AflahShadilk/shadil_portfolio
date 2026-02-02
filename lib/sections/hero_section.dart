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

  Future<void> _downloadResume() async {
    const String resumeUrl = 'https://raw.githubusercontent.com/AflahShadilk/shadil_portfolio/e701a32a1965f005dc5ade576cdc58a24998417e/Aflah_Shadil_Flutter_Developer.pdf.pdf';
    final Uri url = Uri.parse(resumeUrl);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $resumeUrl';
      }
    } catch (e) {
      debugPrint('Error downloading resume: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 120.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: ResponsiveLayout(
            mobile: _buildContent(context, centered: true),
            desktop: Row(
              children: [
                Expanded(flex: 3, child: _buildContent(context, centered: false)),
                const SizedBox(width: 40),
                Expanded(flex: 2, child: _buildIllustration()),
              ],
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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: align,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppTheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppTheme.primary.withValues(alpha: 0.2)),
          ),
          child: Text(
            "Available for projects",
            style: GoogleFonts.outfit(
              color: AppTheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ).animate().fadeIn(duration: const Duration(milliseconds: 600)).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 24),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.white, AppTheme.primary],
          ).createShader(bounds),
          child: Text(
            AppConstants.headline,
            textAlign: textAlign,
            style: GoogleFonts.outfit(
              fontSize: centered ? 40 : 64,
              fontWeight: FontWeight.bold,
              height: 1.1,
              color: Colors.white,
            ),
          ),
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0),
        const SizedBox(height: 16),
        Text(
          AppConstants.subHeadline,
          textAlign: textAlign,
          style: GoogleFonts.outfit(
            fontSize: centered ? 20 : 24,
            color: AppTheme.textSecondary,
            fontWeight: FontWeight.w400,
          ),
        ).animate().fadeIn(delay: const Duration(milliseconds: 400)),
        const SizedBox(height: 32),
        Text(
          AppConstants.intro,
          textAlign: textAlign,
          style: GoogleFonts.outfit(
            fontSize: 18,
            color: AppTheme.textMuted,
            height: 1.6,
          ),
        ).animate().fadeIn(delay: const Duration(milliseconds: 600)),
        const SizedBox(height: 48),
        Wrap(
          alignment: centered ? WrapAlignment.center : WrapAlignment.start,
          spacing: 20,
          runSpacing: 20,
          children: [
            _buildPrimaryButton(
              onPressed: _downloadResume,
              text: "Download CV",
              icon: Icons.download_rounded,
            ),
            _buildSecondaryButton(
              onPressed: onSeeProjects,
              text: "Portfolio",
              icon: Icons.arrow_forward_rounded,
            ),
          ],
        ).animate().fadeIn(delay: const Duration(milliseconds: 800)).scale(begin: const Offset(0.9, 0.9)),
      ],
    );
  }

  Widget _buildPrimaryButton({required VoidCallback onPressed, required String text, required IconData icon}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton({required VoidCallback onPressed, required String text, required IconData icon}) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
      ),
    );
  }

  Widget _buildIllustration() {
    return Container(
      height: 500,
      width: 500,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            AppTheme.primary.withValues(alpha: 0.2),
            AppTheme.primary.withValues(alpha: 0),
          ],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Orbital circles
          _buildOrbital(radius: 200, duration: 20.seconds),
          _buildOrbital(radius: 140, duration: 15.seconds, reverse: true),
          
          Center(
            child: Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 40,
                  ),
                ],
              ),
              child: const Icon(
                Icons.flutter_dash_rounded,
                size: 150,
                color: AppTheme.primary,
              ),
            ),
          ).animate().fadeIn(delay: const Duration(milliseconds: 1000)).scale(),
        ],
      ),
    );
  }

  Widget _buildOrbital({required double radius, required Duration duration, bool reverse = false}) {
    return Container(
      height: radius * 2,
      width: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withValues(alpha: 0.05), width: 2),
      ),
    ).animate(onPlay: (controller) => controller.repeat())
        .rotate(begin: 0, end: reverse ? -1 : 1, duration: duration);
  }
}