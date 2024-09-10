# Weather App Documentation

## Table of Contents
1. [Project Overview](#project-overview)
2. [Project Structure](#project-structure)
3. [Design Decisions](#design-decisions)
4. [How to Run the App](#how-to-run-the-app)

## Project Overview

The Weather App is a multi-screen application designed to provide real-time weather updates for various cities. The app integrates with Firebase for user authentication, fetches live weather data from an API, and includes custom widgets for an enhanced user experience. The design focuses on a responsive layout, advanced UI/UX elements, and smooth transitions.

### Core Features
- **User Authentication**: Managed via Firebase Authentication for secure login, registration, and user management.
- **Weather Data Integration**: Fetches and displays real-time weather data using a RESTful API.
- **Custom Animations and Widgets**: Custom-built components to enhance user interaction and overall design.

## Project Structure

The app is structured in a modular way to ensure code maintainability and scalability:

### 1. **lib/components**
- **items**: Contains reusable UI components, such as:
  - `additional_info_item.dart`: Displays extra weather information (humidity, wind speed).
  - `hourly_forecast_item.dart`: Shows hourly weather forecasts.
- **exdrawer.dart**: Custom drawer component used for navigation.

### 2. **lib/essentials**
- **pakistani_cities_only.dart**: Lists Pakistani cities used for city selection.
- **secrets.dart**: Stores sensitive information like API keys (ensure this file is secured).

### 3. **lib/features/user_auth**
- **firebase_auth_implementation**: Manages Firebase authentication services.
  - `firebase_auth_services.dart`: Handles authentication logic.
  - `save_user.dart`: Saves user data to Firebase.
  - `update_user.dart`: Updates user information.
- **presentation**: Handles the visual representation of user authentication.
  - **pages**: Includes screens related to user authentication:
    - `login_page.dart`
    - `sign_up_page.dart`
    - `forgot_password_page.dart`
    - `auth_via_page.dart`
    - `room_booking_page.dart`
    - `room_details_page.dart`
    - `payment_successful_page.dart`

### 4. **lib/screens**
- **city_selection_screen.dart**: Allows users to select cities for weather updates.
- **contact_us_screen.dart**: Provides a way for users to contact app support.
- **home_screen.dart**: The main screen displaying the current weather and forecasts.

### 5. **lib/services**
- **get_current_weather.dart**: Fetches real-time weather data from the API.
- **toast.dart**: Displays notifications and alerts within the app.
- **main.dart**: The entry point of the app.

## Design Decisions

- **Modular Structure**: The project is divided into logical modules, such as components, screens, and services, to ensure code maintainability and scalability.
- **Responsive Design**: All screens and widgets are designed to adjust seamlessly across different devices and screen sizes.
- **State Management**: The app uses Provider/Bloc for efficient state management, enhancing the app’s performance and responsiveness.
- **User Interface**: Focuses on a clean and modern UI with animations and transitions to improve the user experience.

## How to Run the App

### Prerequisites
- Flutter SDK installed on your machine.
- Firebase account set up with the necessary configurations for authentication.
- API key for the weather data provider.

### Steps to Run
1. **Clone the Repository**:
   ```bash
   git clone [<repository-url>](https://github.com/tahagoheer/Weather-App)

2. **Navigate to the Project Directory**:
   ```bash
   cd weather_app
   ```
3. **Install Dependencies**:
   ```bash
   flutter pub get
   ```
4. **Set Up Firebase**:
   - Follow the Firebase setup instructions for iOS and Android, adding `google-services.json` or `GoogleService-Info.plist` to the project.

5. **Run the App**:
   ```bash
   flutter run
   ```
6. **Troubleshooting**:
   - If you encounter errors, ensure all dependencies are installed and configured correctly.
   - Check that your API key is correctly set in `secrets.dart`.

## Troubleshooting
- Ensure that all dependencies are up to date.
- Verify that Firebase is correctly configured for both Android and iOS.
- Confirm that API keys are correctly placed and used in the application.

