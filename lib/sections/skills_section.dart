import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/app_theme.dart';
import '../widgets/skill_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
                    "Skills & Tools",
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
                    "My technical toolkit for building modern user experiences",
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
              
              Wrap(
                spacing: 32,
                runSpacing: 32,
                alignment: WrapAlignment.center,
                children: [
                  SkillCard(
                    icon: FontAwesomeIcons.flutter,
                    title: "Flutter",
                    category: "Framework",
                  ),
                  SkillCard(
                    icon: FontAwesomeIcons.dartLang,
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
                    icon: Icons.architecture_rounded,
                    title: "Architecture",
                    category: "Clean Code",
                  ),
                  SkillCard(
                    icon: Icons.storage_rounded,
                    title: "Hive / SQLite",
                    category: "Local DB",
                  ),
                  SkillCard(
                    icon: Icons.design_services_rounded,
                    title: "UI/UX",
                    category: "Design",
                  ),
                  SkillCard(
                    icon: Icons.bolt_rounded,
                    title: "State Mgmt",
                    category: "Bloc / Provider",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
