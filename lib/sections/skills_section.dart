import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_theme.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
      child: Column(
        children: [
          Text(
            "Skills",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppTheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Technologies & Tools I work with",
            style: GoogleFonts.inter(fontSize: 16, color: AppTheme.textSecondary),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: const [
              SkillCard(
                icon: FontAwesomeIcons.flutter,
                title: "Flutter",
                category: "Framework",
              ),
              SkillCard(
                icon: FontAwesomeIcons.dartLang, // Corrected from dart
                title: "Dart",
                category: "Language",
              ),
              SkillCard(
                icon: FontAwesomeIcons.fire,
                title: "Firebase",
                category: "Backend",
              ),
              SkillCard(
                icon: FontAwesomeIcons.server,
                title: "REST API",
                category: "Integration",
              ),
              SkillCard(
                icon: Icons.architecture,
                title: "Clean UI",
                category: "Design",
              ),
              SkillCard(
                icon: Icons.storage,
                title: "Offline Storage",
                category: "Local DB",
              ),
              SkillCard(
                icon: Icons.code,
                title: "Clean Code",
                category: "Practice",
              ),
              SkillCard(
                icon: Icons.settings,
                title: "State Mgmt",
                category: "Architecture",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
