# Sivagame P — Flutter Web Portfolio

A personal developer portfolio built with **Flutter Web** and **Dart**.

## ✨ Features
- Animated hero with typewriter role text
- Smooth scroll navigation with active section highlighting
- Responsive layout (mobile + desktop)
- Noto Serif typography throughout
- Glass-card UI with hover effects
- All sections: Hero, About, Skills, Experience, Projects, Education, Certifications, Contact

## 🚀 Quick Start

### Prerequisites
- Flutter SDK ≥ 3.0.0 (with web support enabled)
- Chrome browser

### Run locally
```bash
# 1. Clone / copy this project folder
cd sivagame_portfolio

# 2. Enable Flutter web (first time only)
flutter config --enable-web

# 3. Install dependencies
flutter pub get

# 4. Run in Chrome
flutter run -d chrome
```

### Build for production
```bash
flutter build web --release
# Output in: build/web/
# Deploy the build/web/ folder to any static host (Netlify, Vercel, GitHub Pages, Firebase Hosting)
```

## 📁 Project Structure
```
lib/
├── main.dart               # Entry point
├── app.dart                # Theme & colors
├── home_page.dart          # Main scroll layout & nav
├── widgets/
│   ├── nav_bar.dart        # Top navigation bar
│   └── section_wrapper.dart # Reusable section layout + GlassCard
└── sections/
    ├── hero_section.dart
    ├── about_section.dart
    ├── skills_section.dart
    ├── experience_section.dart
    ├── projects_section.dart
    ├── education_section.dart
    ├── certifications_section.dart
    └── contact_section.dart
```

## 🎨 Tech Stack
- Flutter Web + Dart
- `google_fonts` — Noto Serif + Source Code Pro
- `animated_text_kit` — Typewriter animation
- `url_launcher` — Email / social links
- `flutter_animate` — Animations

## 🌐 Deploy to GitHub Pages
```bash
flutter build web --release --base-href "/your-repo-name/"
# Push build/web/ to gh-pages branch
```
