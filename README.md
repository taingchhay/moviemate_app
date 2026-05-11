# moviemate_app
# 🎬 CineMate Practice App

## 📌 Project Overview

CineMate Practice App is a Flutter practice project designed to simulate a real-world streaming application architecture similar to the CINEMATE internship project.

This project focuses on learning:
- Flutter modular architecture
- Bloc state management
- API integration
- Reusable component design
- Feature-based development
- Clean code structure
- Real-world frontend workflow

The application allows users to:
- Browse movies
- Search entertainment content
- View promotions
- Explore short film rooms
- Practice frontend-backend integration

This project is intended for learning and internship preparation purposes.

---

# 🎯 Project Goals

The main goal of this project is to practice building scalable Flutter applications using modern architecture and development workflows.

---

# 🛠 Technologies Used

## Frontend
- Flutter
- Dart

## State Management
- flutter_bloc

## API & Networking
- dio

## UI Design
- Material Design
- Responsive Layout

## Development Tools
- VS Code / Android Studio
- Git & GitHub

---

# 📂 Project Structure

```txt
lib/
│
├── core/
│   ├── constants/
│   │   └── app_colors.dart
│   │
│   ├── theme/
│   │   └── app_theme.dart
│   │
│   └── network/
│       └── dio_client.dart
│
├── shared/
│   ├── widgets/
│   │   ├── movie_card.dart
│   │   ├── custom_app_bar.dart
│   │   └── loading_widget.dart
│   │
│   └── models/
│       └── movie_model.dart
│
├── features/
│   ├── home/
│   │   ├── presentation/
│   │   │   └── home_screen.dart
│   │   │
│   │   ├── bloc/
│   │   │   ├── home_bloc.dart
│   │   │   ├── home_event.dart
│   │   │   └── home_state.dart
│   │   │
│   │   └── data/
│   │       └── home_repository.dart
│   │
│   ├── search/
│   │   └── presentation/
│   │       └── search_screen.dart
│   │
│   ├── promotion/
│   │   └── presentation/
│   │       └── promotion_screen.dart
│   │
│   └── short_room/
│       └── presentation/
│           └── short_room_screen.dart
│
└── main.dart
