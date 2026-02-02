import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/app_theme.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/experience_section.dart';
import 'sections/why_hire_me_section.dart';
import 'sections/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.background.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  "Aflah Shadil",
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 1.2,
                  ),
                ),
                actions: [
                  if (MediaQuery.of(context).size.width > 800) ...[
                    _NavBarItem("About", () => _scrollToSection(_aboutKey)),
                    _NavBarItem("Skills", () => _scrollToSection(_skillsKey)),
                    _NavBarItem("Projects", () => _scrollToSection(_projectsKey)),
                    _NavBarItem("Experience", () => _scrollToSection(_experienceKey)),
                    _NavBarItem("Contact", () => _scrollToSection(_contactKey)),
                    const SizedBox(width: 16),
                  ] else ...[
                    // Mobile Menu
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.menu_rounded),
                      onSelected: (value) {
                        switch (value) {
                          case 'About': _scrollToSection(_aboutKey); break;
                          case 'Skills': _scrollToSection(_skillsKey); break;
                          case 'Projects': _scrollToSection(_projectsKey); break;
                          case 'Experience': _scrollToSection(_experienceKey); break;
                          case 'Contact': _scrollToSection(_contactKey); break;
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(value: 'About', child: Text('About')),
                        const PopupMenuItem(value: 'Skills', child: Text('Skills')),
                        const PopupMenuItem(value: 'Projects', child: Text('Projects')),
                        const PopupMenuItem(value: 'Experience', child: Text('Experience')),
                        const PopupMenuItem(value: 'Contact', child: Text('Contact')),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(
              key: _heroKey,
              onSeeProjects: () => _scrollToSection(_projectsKey),
            ),
            AboutSection(key: _aboutKey),
            SkillsSection(key: _skillsKey),
            ProjectsSection(key: _projectsKey),
            ExperienceSection(key: _experienceKey),
            WhyHireMeSection(),
            ContactSection(key: _contactKey),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarItem(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: GoogleFonts.outfit(
            color: Colors.white.withValues(alpha: 0.9),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
