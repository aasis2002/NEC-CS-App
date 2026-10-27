# Firebase Setup & Authentication Guide for NEC CSE Prep App

This app is architected with an **offline-first** design. Users can immediately practice quizzes, take 50-MCQ exams, and read notes in **Guest Mode**. When ready, they can connect Firebase to enable cross-device cloud synchronization.

---

## 1. Firebase Project Creation
1. Go to the [Firebase Console](https://console.firebase.google.com/) and create a project: `nec-cse-prep`.
2. Add an **Android** app:
   - Android Package name: `com.example.nec_cs` (found in `android/app/build.gradle.kts`).
   - Download `google-services.json` and place it in: `android/app/google-services.json`.
3. Add an **iOS** app (if targeting iOS):
   - iOS bundle ID: `com.example.necCs`.
   - Download `GoogleService-Info.plist` and add it to `ios/Runner/` via Xcode.
4. Run FlutterFire CLI (recommended):
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```

---

## 2. Authentication Providers
In Firebase Console > **Authentication** > **Sign-in method**:
1. **Email/Password**: Enable.
2. **Google Sign-In**: Enable.
   - For Android, generate and add your SHA-1 fingerprint:
     ```powershell
     cd android
     ./gradlew signingReport
     ```
3. **Anonymous (Guest Mode)**: Enable to support seamless guest-to-registered account transition.

---

## 3. Firestore Setup & Security Rules
1. In Firebase Console > **Firestore Database**, create a database in production mode.
2. Deploy the included `firestore.rules` file:
   ```bash
   firebase deploy --only firestore:rules
   ```

### Security Rules Highlights:
- **Read-Only Syllabus/Catalog**: Syllabus units and public question banks are universally readable but only admin-writable.
- **Strict User Isolation**: `/users/{userId}/**` documents can strictly only be read and written if `request.auth.uid == userId`.
- **Last-Write-Wins Sync**: Cloud sync compares `updatedAt` ISO-8601 timestamps on each record to resolve local vs remote conflict.
