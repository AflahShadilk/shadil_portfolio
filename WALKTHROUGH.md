# Portfolio Implementation Walkthrough

I have successfully built a modern, responsive Flutter Web portfolio. Here is a summary of the work completed.

## 🏗️ Structure

The project is organized into a clean and scalable structure:

- **`lib/core/`**: Contains app-wide constants and theme configuration.
  - `app_theme.dart`: Defines the dark mode theme, colors, and typography (Google Fonts).
  - `app_constants.dart`: Stores all the text content (Name, Role, Descriptions, Links).
- **`lib/widgets/`**: Reusable UI components.
  - `responsive_layout.dart`: Handles responsive design for Mobile, Tablet, and Desktop.
  - `project_card.dart`: A responsive card component to showcase projects with images and links.
  - `skill_card.dart`: An interactive card for displaying skills with hover effects.
- **`lib/sections/`**: Modular sections of the portfolio.
  - `hero_section.dart`: First impression with animations and CTA.
  - `about_section.dart`: Brief introduction.
  - `skills_section.dart`: Grid/Wrap of technical skills.
  - `projects_section.dart`: Showcase of key projects (Arogya Mate, Rizq Mart).
  - `experience_section.dart`: Timeline of professional experience.
  - `why_hire_me_section.dart`: Key strengths.
  - `contact_section.dart`: Contact form and social links.
- **`lib/home_page.dart`**: The main scaffold that assembles all sections and handles navigation.

## 🎨 Design & Features

- **Dark Mode**: A sleek dark theme using specific deep blue/grey tones (`#222831`, `#393E46`) and Cyan accent (`#00ADB5`).
- **Typography**: Used `Poppins` for headings and `Inter` for body text.
- **Responsiveness**: All sections adapt to screen size using `LayoutBuilder` and `Wrap` widgets.
- **Animations**: Added subtle entrance animations using `flutter_animate` in the Hero section and hover effects on Skill cards.
- **Navigation**: smooth scrolling to sections via the top navigation bar.

## 🚀 How to Run

1.  **Get Dependencies**:
    ```bash
    flutter pub get
    ```
2.  **Run (Web)**:
    ```bash
    flutter run -d chrome
    ```

## 📝 Next Steps for You

1.  **Add Images**: Place your project screenshots in the `assets/` folder:
    - `assets/arogya_mate.png`
    - `assets/rizq_mart.png`
2.  **Update Links**: Edit `lib/core/app_constants.dart` to add your real Resume URL, LinkedIn, etc.
3.  **Resume Download**: Implement the logic in `lib/sections/hero_section.dart` inside the "Download Resume" button (e.g., `launchUrl` to a PDF link).
