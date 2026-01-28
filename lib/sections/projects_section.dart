import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_theme.dart';
import '../widgets/project_card.dart';
import '../widgets/responsive_layout.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.background,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
      child: Column(
        children: [
          Text(
            "Projects",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppTheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Some of my recent works",
            style: GoogleFonts.inter(fontSize: 16, color: AppTheme.textSecondary),
          ),
          const SizedBox(height: 60),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                children: const [
                  ProjectCard(
                    title: "Arogya Mate",
                    description:
                        "An offline healthcare management application designed to manage doctors, patients, and appointments efficiently. Features offline data storage, patient & doctor management, and a clean UI.",
                    techStack: ["Flutter", "Dart", "Hive", "Local Storage"],
                    imagePath: "assets/appicon (2).png",
                    codeUrl: "https://github.com/AflahShadilk/Arogyamate-project",
                    liveUrl: null,
                  ),
                  SizedBox(height: 40),
                  ProjectCard(
                    title: "Rizq Mart",
                    description:
                        "A full-featured e-commerce application with separate Admin and User modules. Features user authentication, product management, admin dashboard, and order handling.",
                    techStack: ["Flutter", "Firebase Auth", "Cloud Firestore", "API"],
                    imagePath: "assets/appIcon.png",
                    codeUrl: "https://github.com/AflahShadilk/rizqmart_app",
                    liveUrl: null, // "https://rizqmart.web.app",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
