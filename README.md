# Absence Manager

A Flutter based absence management app for team member.

## Technologies Used

- **Flutter**: Frontend framework for building cross-platform apps.
- **Flutter Bloc**: State management solution using the BLoC (Business Logic Component) pattern.
- **Dio**: For making HTTP requests.
- **Secured Shared Preferences**: To persist app settings securely.
- **Firebase analytics**: Integrated to track user interactions and gather insights on app usage for better decision-making.
- **Firebase Crashlytics**: Provides real-time crash reporting and diagnostics to help identify and fix stability issues in the app.
- **Go router**: A modern and flexible navigation solution using URL-based routing, allowing for smooth and declarative navigation flows.
- **Localization**: Multi-language support.
- **Testing**: Test-driven development practices implemented to ensure robust and reliable code through unit, widget, and integration tests.
- **CI/CD Integration**: Automated Continuous Integration and Continuous Deployment pipeline to streamline the development process, ensuring faster, reliable, and error-free releases.
- **Linter**: Uses flutter_lints for static analysis to enforce best practices and maintain code quality.

## Product Requirements 

- [x] I want to see a list of absences including the names of the employees.
- [x] I want to see the first 10 absences, with the ability to paginate.
- [x] I want to see a total number of absences.
- [x] For each absence I want to see:
    - [x] Member name
    - [x] Type of absence
    - [x] Period
    - [x] Member note (when available)
    - [x] Status (can be 'Requested', 'Confirmed' or 'Rejected')
    - [x] Admitter note (when available)
- [x] I want to filter absences by type.
- [x] I want to filter absences by date.
- [x] I want to see a loading state until the list is available.
- [x] I want to see an error state if the list is unavailable.
- [x] I want to see an empty state if there are no results.
- [x] (Bonus) I can generate an iCal file and import it into outlook.

## Additional Features

- [x] API implemented using laravel
- [x] Theme - Dark and Light Mode support
- [x] Localization support (English and German)
- [x] Firebase analytics and crashlytics integrated
- [x] CI/CD implemented using github action
- [x] Linting - static analysis to enforce best practices and maintain code quality
- [x] Documentation
- [x] Basic widget testing has been implemented for a few widgets. Further testing may be added in future updates.
- [x] .env file to securely store and manage sensitive keys, such as API keys

## Screenshots

Here are some screenshots of the App in action:

### Home Screen
<div style="display: flex; gap: 10px;">
    <img src="https://drive.google.com/uc?export=view&id=13XteW6bz2TqtBp6G7dfuoohtxvdQoNDZ" alt="Home Screen" width="300"/>
    <img src="https://drive.google.com/uc?export=view&id=12lINTU3woEoTuuW_Bm25zayRe8CdB0Kc" alt="Home Screen" width="300"/>
    <img src="https://drive.google.com/uc?export=view&id=1_X_n7KaC1aPVMYoXQiZ4JhvJjWd0sBjo" alt="Home Screen" width="300"/>
    <img src="https://drive.google.com/uc?export=view&id=1QsKgPMxMJ86DELtNkYfYCKgoBFy2k6F5" alt="Home Screen" width="300"/>
</div>

### Settings

<div style="display: flex; gap: 10px;">
   <img src="https://drive.google.com/uc?export=view&id=1-uegM1U9WybjtB6GTqlZHXUMnt3obWMC" alt="Home Screen" width="300"/>
</div>

## Video Preview

Here’s a video preview of the App in action: [Video](https://drive.google.com/file/d/1gB7wrSJVx7tCAaCIS8y3vxyZDYiav3Dd/view)


## Getting Started

Follow these instructions to set up the project and run it locally.

### Prerequisites

- Flutter SDK: 3.24.0 [Installation Guide](https://flutter.dev/docs/get-started/install)
- Java 12
- Dart SDK (included with Flutter)
- IDE (e.g., Visual Studio Code, Android Studio)

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/habiburrahmantalha/todo.git
   cd todo
   flutter pub get
   flutter run

2. **Add Environment File with API Key**

    - Create a .env file in the root directory of the project.
    - Add API key
    - API_KEY=A1B2C3D4E5F6G7H8I9J0K1L2M3N4O5P6Q7R8S9T0U1V2W3X4Y5Z6A7B8C9D0E1F2G3
   
   ```bash
     assets:
      - .env #uncomment this line before trying debug build
