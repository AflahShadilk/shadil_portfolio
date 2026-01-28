import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/app_theme.dart';
import 'responsive_layout.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> techStack;
  final String? imagePath; // Placeholder for image
  final String? codeUrl;
  final String? liveUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.techStack,
    this.imagePath,
    this.codeUrl,
    this.liveUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: ResponsiveLayout(
        mobile: _buildMobileLayout(context),
        desktop: _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: _buildImageStub(),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: _buildContent(isDesktop: true),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 200, child: _buildImageStub()),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildContent(isDesktop: false),
        ),
      ],
    );
  }

  Widget _buildImageStub() {
    if (imagePath != null) {
      return Image.asset(
        imagePath!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[800],
            child: const Center(
              child: Icon(Icons.broken_image, size: 64, color: Colors.grey),
            ),
          );
        },
      );
    }
    return Container(
      color: Colors.grey[800],
      child: const Center(
        child: Icon(Icons.image, size: 64, color: Colors.grey),
      ),
    );
  }

  Widget _buildContent({required bool isDesktop}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppTheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: AppTheme.textPrimary,
            height: 1.5,
          ),
          maxLines: isDesktop ? 4 : 10,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: techStack
              .map(
                (tech) => Chip(
                  label: Text(tech),
                  backgroundColor: AppTheme.background,
                  labelStyle: const TextStyle(color: AppTheme.textSecondary),
                  side: BorderSide.none,
                ),
              )
              .toList(),
        ),
        if (isDesktop) const Spacer(), // Safe in fixed height column
        if (!isDesktop) const SizedBox(height: 24),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            if (codeUrl != null)
              OutlinedButton.icon(
                onPressed: () {
                  launchUrl(Uri.parse(codeUrl!));
                },
                icon: const Icon(Icons.code),
                label: const Text("View Code"),
              ),
            if (liveUrl != null)
              ElevatedButton.icon(
                onPressed: () {
                  launchUrl(Uri.parse(liveUrl!));
                },
                icon: const Icon(Icons.launch),
                label: const Text("Live Demo"),
              ),
          ],
        ),
      ],
    );
  }
}
