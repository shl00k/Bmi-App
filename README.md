# BMI Calculator 📊

A clean and responsive BMI Calculator built with Flutter. The app supports multiple measurement units, reusable UI components, and a layered architecture that separates presentation, domain logic, and theming for better maintainability and scalability.

## Features ✨

* Calculate Body Mass Index (BMI)
* Support for metric and imperial units
* Interactive height and weight selection
* Clean and responsive UI
* Reusable widget-based design
* Centralized theming system
* Organized project architecture

## Project Structure 📁

```text
lib/
├── data/
├── domain/
├── presentation/
│   ├── pages/
│   ├── components/
│   └── widgets/
└── theme/
```

## Architecture 🏗️

The project follows a layered architecture:

* **Presentation Layer** – UI screens and widgets
* **Domain Layer** – BMI calculation and unit conversion logic
* **Theme Layer** – Colors, typography, and app styling

This separation improves code readability, maintainability, and testability.

## Getting Started 🚀

### Prerequisites

* Flutter SDK
* Dart SDK
* Android Studio / VS Code

### Installation

```bash
git clone https://github.com/your-username/bmi-calculator.git
cd bmi-calculator
flutter pub get
flutter run
```

## Built With 🛠️

* Flutter
* Dart

## Future Improvements 🔮

* State management (Riverpod/Bloc)
* Unit tests
* BMI history tracking
* Health recommendations
* Dark mode support

## Screenshots 📸

*Add screenshots here.*

## License 📄

This project is licensed under the MIT License.
