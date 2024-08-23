# Polartern Test App

This is a simple Flutter application that demonstrates a splash screen, navigation to a detailed trip information view, capturing and sharing a screenshot of the current screen, and a slider that navigates to a success screen with a button to restart the cycle. The app includes unit tests for each view and follows a basic hexagonal architecture, keeping the testing complexity in mind.

## Features

- **Splash Screen**: The app starts with a splash screen that automatically redirects to the main view after a brief delay.
- **Trip Information View**: Displays detailed information about a road trip, including the date, time, cost, and location.
- **Screenshot Capture**: Allows the user to capture and share a screenshot of the current screen.
- **Slider Navigation**: A slider that, when fully swiped, navigates to a success screen.
- **Success Screen**: Displays a congratulatory message with a button to restart the app cycle.
- **Basic Hexagonal Architecture**: The app is designed with a simple hexagonal architecture to facilitate testing.

## Getting Started

### Prerequisites

- **Flutter SDK**: Make sure you have Flutter installed on your machine. You can download it from [Flutter's official website](https://flutter.dev/docs/get-started/install).

### Installation

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/BOBMAXIMUS/polartern_test.git
   ```

   Navigate to the project directory:

   ```bash
   cd polartern_test
   ```

2. **Install Dependencies**:
   Run the following command to get all the necessary dependencies:

   ```bash
   flutter pub get
   ```

3. **Run the App**:
   You can run the app on an emulator or a connected device:

   ```bash
   flutter run
   ```

4. **Run Tests**:
   To execute the unit tests included in the project, use:

   ```bash
   flutter test
   ```

### Project Structure

The project is structured to follow a basic hexagonal architecture, making it easier to extend and test. The core logic is separated from the UI, with a focus on maintainability and scalability.

- **lib/**: Contains the main application code.
- **test/**: Contains unit tests for the views and components.

### Usage

- **Splash Screen**: Automatically redirects to the trip information view.
- **Trip Information View**: Provides details about the trip and includes options to share a screenshot.
- **Slider**: Slide to navigate to the success screen.
- **Success Screen**: Restart the app cycle by pressing the button.
