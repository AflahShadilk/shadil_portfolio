import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/app_constants.dart';
import '../core/app_theme.dart';
import '../widgets/responsive_layout.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
      child: Column(
        children: [
          Text(
            "Contact Me",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppTheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Let's work together",
            style: GoogleFonts.inter(
              fontSize: 16,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: _buildContactCard(),
          ),
          const SizedBox(height: 80),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildContactCard() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.primary.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Get In Touch",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "I'm currently looking for new opportunities as a Flutter Developer. Whether you have a question or just want to say hi, I'll try my best to get back to you!",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 16,
              color: AppTheme.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildContactOption(
                icon: Icons.email_rounded,
                label: "Email Me",
                value: AppConstants.email,
                onTap: () => launchUrl(Uri.parse("mailto:${AppConstants.email}")),
              ),
              _buildContactOption(
                icon: Icons.phone_rounded,
                label: "Call Me",
                value: AppConstants.phone,
                onTap: () => launchUrl(Uri.parse("tel:${AppConstants.phone}")),
              ),
            ],
          ),
          const SizedBox(height: 48),
          const Divider(color: Colors.white10),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _buildSocialButton(FontAwesomeIcons.github, AppConstants.github),
              _buildSocialButton(FontAwesomeIcons.linkedin, AppConstants.linkedin),
              const SizedBox(width: 8), 
              _buildResumeButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactOption({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppTheme.primary, size: 24),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResumeButton() {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Add resume PDF URL or asset path here
        // launchUrl(Uri.parse("YOUR_RESUME_URL"));
      },
      icon: const Icon(Icons.download_rounded, size: 20),
      label: const Text("Download Resume"),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String url) {
    return IconButton(
      onPressed: () => launchUrl(Uri.parse(url)),
      icon: FaIcon(icon, color: Colors.white, size: 24),
      style: IconButton.styleFrom(
        backgroundColor: AppTheme.surface,
        padding: const EdgeInsets.all(12),
        side: const BorderSide(color: Colors.white10),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        const Divider(color: Colors.white24),
        const SizedBox(height: 24),
        Text(
          "Designed & Built by ${AppConstants.name}",
          style: GoogleFonts.inter(color: AppTheme.textSecondary, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Text(
          "© 2025 All rights reserved.",
          style: GoogleFonts.inter(color: Colors.grey[600], fontSize: 12),
        ),
      ],
    );
  }
}
