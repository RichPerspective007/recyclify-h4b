# Recyclify - Green Tech Electronics Recycling App

Recyclify is a green technology application designed to streamline the process of recycling electronics. By using Cloud Firestore and Firebase Analytics, Recyclify helps users find recycling centers, track their recycling activities, and promote sustainable practices.

## Features

- **Find Recycling Centers:** Locate nearby electronics recycling centers.
- **Track Recycling Activities:** Keep a record of your recycling habits.
- **Sustainability Tips:** Get tips on how to reduce electronic waste.
- **Analytics:** Track user engagement and app performance using Firebase Analytics.

## Technologies Used

- **Google Flutter:** Frontend framework for building cross-platform mobile applications.
- **Cloud Firestore:** Backend NoSQL database for storing recycling center locations and user data.
- **Firebase Analytics:** Service to track user engagement and app performance.

- **Firebase Storage:** Service to store user data.

- **Firebase Storage Database:**  to store user data in an organized database specifying users and their data.



## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- Flutter SDK: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
- Firebase CLI: [Firebase CLI Installation](https://firebase.google.com/docs/cli#install_the_firebase_cli)
- A Google account with access to Firebase Console

### Setup Instructions

1. **Clone the Repository**

    ```bash
    git clone https://github.com/yourusername/recyclify.git
    cd recyclify
    ```

2. **Set Up Firebase**

    - Go to the [Firebase Console](https://console.firebase.google.com/).
    - Create a new project named `Recyclify`.
    - Add an Android and/or iOS app to your Firebase project.
    - Follow the instructions to download the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files and place them in the appropriate directories in your Flutter project.
    - Enable Firestore in the Firebase console.
    - Enable Firebase Analytics in the Firebase console.

3. **Configure Firebase in Flutter**

    Add Firebase dependencies to your `pubspec.yaml`:

    ```yaml
    dependencies:
      flutter:
        sdk: flutter
      firebase_core: latest_version
      cloud_firestore: latest_version
      firebase_analytics: latest_version
    ```

4. **Install Dependencies**

    ```bash
    flutter pub get
    ```

5. **Initialize Firebase**

    In your `main.dart`, initialize Firebase:

    ```dart
    import 'package:firebase_core/firebase_core.dart';
    import 'package:flutter/material.dart';

    void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      runApp(RecyclifyApp());
    }

    class RecyclifyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Recyclify',
          home: HomeScreen(),
        );
      }
    }
    ```

6. **Run the App**

    ```bash
    flutter run
    ```

## App Structure

- **lib/**: Contains all Dart files
  - **main.dart**: Entry point of the app
  - **screens/**: Contains various screens such as Home, Recycling Centers, Profile
  - **services/**: Contains services for interacting with Firestore and Firebase Analytics
  - **models/**: Contains data models
  - **widgets/**: Contains reusable widgets

## Contribution

We welcome contributions! Please read our [Contributing Guidelines](CONTRIBUTING.md) for more information.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions or suggestions, please contact us at support@recyclify.com.

