# BMI Calculator

A clean and responsive BMI Calculator built with Flutter. The app supports multiple measurement units, reusable UI components, and a layered architecture that separates presentation, domain logic, and theming for better maintainability and scalability.

## Features

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

## Architecture 

The project follows a layered architecture:

* **Presentation Layer** – UI screens and widgets
* **Domain Layer** – BMI calculation and unit conversion logic
* **Theme Layer** – Colors, typography, and app styling

This separation improves code readability, maintainability, and testability.

<img width="1220" height="2712" alt="bmi_app_light" src="https://github.com/user-attachments/assets/7569d58c-7f39-4466-b963-a29d4c9a16da" />
<img width="1220" height="2712" alt="bmi_app_dark" src="https://github.com/user-attachments/assets/0b7bd465-f435-481c-a684-74b245267308" />

## License 📄

This project is licensed under the MIT License.
