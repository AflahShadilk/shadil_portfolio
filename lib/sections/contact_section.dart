import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/app_constants.dart';
import '../core/app_theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
                    "Get In Touch",
                    style: GoogleFonts.outfit(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: -1,
                    ),
                  ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
                  const SizedBox(height: 16),
                  Container(
                    height: 4,
                    width: 60,
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ).animate().fadeIn(delay: 200.ms).scaleX(begin: 0, end: 1),
                  const SizedBox(height: 24),
                  Text(
                    "Let's build something amazing together",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      color: AppTheme.textSecondary,
                      fontWeight: FontWeight.w400,
                    ),
                  ).animate().fadeIn(delay: 400.ms),
                ],
              ),
              const SizedBox(height: 64),
              
              _buildContactCard(),
              const SizedBox(height: 100),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard() {
    return Container(
      padding: const EdgeInsets.all(48),
      decoration: BoxDecoration(
        color: AppTheme.surface.withAlpha(0.5.toInt() * 255),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withAlpha(0.05.toInt() * 255)),
      ),
      child: Column(
        children: [
          Text(
            "I'm currently seeking new opportunities to create high-quality mobile experiences. My inbox is always open!",
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              fontSize: 20,
              color: AppTheme.textSecondary,
              height: 1.6,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 56),
          Column(
            children: [
              _buildContactOption(
                icon: Icons.alternate_email_rounded,
                label: "Email",
                value: AppConstants.email,
                url: "mailto:${AppConstants.email}",
              ),
              const SizedBox(height: 24),
              _buildContactOption(
                icon: Icons.phone_iphone_rounded,
                label: "Phone",
                value: AppConstants.phone,
                url: "tel:${AppConstants.phone}",
              ),
              const SizedBox(height: 24),
              _buildContactOption(
                icon: Icons.location_on_rounded,
                label: "Location",
                value: AppConstants.location,
                url: "https://maps.google.com/?q=${AppConstants.location}",
              ),
            ],
          ),
          const SizedBox(height: 56),
          _buildResumeButton(),
          const SizedBox(height: 56),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(FontAwesomeIcons.github, AppConstants.github),
              const SizedBox(width: 20),
              _buildSocialButton(FontAwesomeIcons.linkedin, AppConstants.linkedin),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: const Duration(milliseconds: 600)).slideY(begin: 0.1, end: 0);
  }

  Widget _buildContactOption({
    required IconData icon,
    required String label,
    required String value,
    required String url,
  }) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.03),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppTheme.primary, size: 20),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: GoogleFonts.outfit(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _downloadResume() async {
    const String resumeUrl = 'https://raw.githubusercontent.com/AflahShadilk/shadil_portfolio/e701a32a1965f005dc5ade576cdc58a24998417e/Aflah_Shadil_Flutter_Developer.pdf.pdf';
    final Uri url = Uri.parse(resumeUrl);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Widget _buildResumeButton() {
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
        onPressed: _downloadResume,
        icon: const Icon(Icons.download_rounded),
        label: const Text("Download Resume"),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
          backgroundColor: AppTheme.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
      ),
    ).animate().fadeIn(delay: const Duration(milliseconds: 600)).scale();
  }

  Widget _buildSocialButton(IconData icon, String url) {
    return IconButton(
      onPressed: () => launchUrl(Uri.parse(url)),
      icon: FaIcon(icon, color: Colors.white, size: 24),
      style: IconButton.styleFrom(
        backgroundColor: Colors.white.withValues(alpha: 0.05),
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        const SizedBox(height: 80),
        Divider(color: Colors.white.withValues(alpha: 0.05)),
        const SizedBox(height: 40),
        Text(
          "Made with ❤️ by Aflah Shadil K",
          style: GoogleFonts.outfit(
            color: AppTheme.textMuted.withValues(alpha: 0.5),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "© 2025 ${AppConstants.name}. All rights reserved.",
          style: GoogleFonts.outfit(
            color: AppTheme.textMuted.withValues(alpha: 0.4),
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
