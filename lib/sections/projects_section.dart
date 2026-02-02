import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 100.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Section Header
              Column(
                children: [
                  Text(
                    "Featured Projects",
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
                  const SizedBox(height: 24),
                  Text(
                    "Selected work that demonstrates my technical expertise",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      color: AppTheme.textSecondary,
                      fontWeight: FontWeight.w400,
                    ),
                  ).animate().fadeIn(delay: const Duration(milliseconds: 400)),
                ],
              ),
              const SizedBox(height: 80),
              
              // Projects Grid
              ResponsiveLayout(
                mobile: _buildProjectList(context, isMobile: true),
                desktop: _buildProjectList(context, isMobile: false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectList(BuildContext context, {required bool isMobile}) {
    final List<Map<String, dynamic>> projects = [
      {
        "title": "Arogya Mate",
        "description": "Offline-first healthcare management system with robust local storage, patient-doctor workflows, and appointment scheduling.",
        "techStack": ["Flutter", "Hive", "Local Storage", "Clean Arch"],
        "imagePath": "assets/appicon (2).png",
        "codeUrl": "https://github.com/AflahShadilk/Arogyamate-project",
      },
      {
        "title": "Rizq Mart",
        "description": "Full-stack e-commerce platform with admin/user apps, secure authentication, and real-time inventory management.",
        "techStack": ["Flutter", "Firebase", "Stripe", "Cloud Func"],
        "imagePath": "assets/appIcon.png",
        "codeUrl": "https://github.com/AflahShadilk/rizqmart_app",
      },
    ];

    if (isMobile) {
      return Column(
        children: projects.asMap().entries.map((e) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: ProjectCard(
              title: e.value["title"],
              description: e.value["description"],
              techStack: e.value["techStack"],
              imagePath: e.value["imagePath"],
              codeUrl: e.value["codeUrl"],
              index: e.key,
            ),
          );
        }).toList(),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: projects.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 32,
            mainAxisSpacing: 32,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return ProjectCard(
              title: projects[index]["title"],
              description: projects[index]["description"],
              techStack: projects[index]["techStack"],
              imagePath: projects[index]["imagePath"],
              codeUrl: projects[index]["codeUrl"],
              index: index,
            );
          },
        );
      },
    );
  }
}