# Proments

Proments, short for Project Moments, is a Flutter project designed to facilitate the creation of projects and the addition of moments within these projects. Users can compile these moments into a timelapse video. The app also includes a feature to notify users when to upload a moment based on selected preferences.

**Note:** Currently, the app has been tested on Android devices.

## Issues with Notification Feature

There are known issues related to the notification feature, especially on devices from Chinese OEMs. This is due to the behavior of certain OEMs like Xiaomi and Oppo, which restrict background processes like WorkManager under battery optimization. More information about this issue can be found [here](https://stackoverflow.com/questions/59906497/work-manager-on-chinese-roms-like-xiaomi-and-oppo-when-under-battery-optimizati).

## Installation Guide and Building/Releasing the App

### Installing Icons

### Installation Guide

#### Android:

Before building the app for release on Android and deploying it to the Google Play Store, follow these steps:

1. **Set Up Signing Keys for Google Play:**

   You'll need to generate a signing key for your app. Here's a brief overview of the steps:

   - Open a terminal window and navigate to the root directory of your Flutter project.
   - Run the following command to generate a new signing key:

     ```bash
     keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
     ```

     Replace `~/key.jks` with the path and name you want for your keystore file.

   - Follow the prompts to enter the required information (password, name, organization, etc.).

2. **Configuring the Signing Key in Flutter:**

   Once you've generated your keystore file, configure it in your Flutter project:

   - Create a file named `key.properties` in the `android` folder of your Flutter project.
   - Add the following lines to `key.properties`:

     ```properties
     storePassword=<your_keystore_password>
     keyPassword=<your_key_password>
     keyAlias=key
     storeFile=<path_to_your_keystore_file>
     ```

     Replace `<your_keystore_password>` and `<your_key_password>` with the passwords you used when generating the keystore file. Update `<path_to_your_keystore_file>` with the actual path to your keystore file.

3. **Build the App for Release:**

   To generate a release APK for Google Play:

   - Open a terminal window and navigate to the root directory of your Flutter project.
   - Run the following command:
     ```bash
     flutter build apk --release
     ```
     This command will generate an APK file under the `build/app/outputs/flutter-apk` directory.

4. **Upload to Google Play Console:**

   - Log in to your [Google Play Console](https://play.google.com/apps/publish/).
   - Create a new app and follow the steps to upload the generated APK file.
   - Complete the required information, such as app details, screenshots, etc.
   - Once done, submit the app for review and release.

These steps should help you prepare your Flutter app for release on the Google Play Store.
