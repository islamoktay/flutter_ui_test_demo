# UI Testing Flutter Apps with Maestro

## Introduction to Mobile UI Testing with Maestro

In today’s fast-paced digital world, mobile applications have become a central part of our daily lives, and users expect seamless, intuitive experiences on their devices. To meet this expectation, developers must ensure that their applications are visually appealing, functional, and bug-free across diverse platforms and devices. UI testing, or User Interface testing, plays a crucial role in achieving this by simulating real user interactions to verify that an app responds as intended. Without thorough UI testing, apps risk issues like broken layouts, unresponsive elements, and inconsistent user journeys, all of which can harm user satisfaction and app ratings. Effective UI testing is thus essential for delivering a polished, reliable mobile app.

One powerful tool that has gained attention in the mobile development community for UI testing is **Maestro**. This UI testing framework simplifies the process of writing and running UI tests, making it easier for developers to identify issues quickly. Since Maestro leverages accessibility information, it’s well-suited for Flutter applications, where accessibility semantics can simplify UI element interaction, contributing to Maestro's ease of use across both native and cross-platform apps.

> Maestro is the fastest and easiest way to create end-to-end UI tests for your mobile app — no matter whether it’s built with native or cross-platform technologies. Maestro isn’t an “Android testing framework” or “Flutter testing framework” — it’s a “UI” testing framework, thanks to the fact that it depends only on accessibility information.  
> [The power of open-source. Making Maestro work better with Flutter](https://blog.mobile.dev/the-power-of-open-source-making-maestro-work-better-with-flutter-d92b386f9a33) by Bartek Pacia

For a more in-depth look at Maestro’s compatibility with Flutter, check out [this article](https://blog.mobile.dev/the-power-of-open-source-making-maestro-work-better-with-flutter-d92b386f9a33).

## Quick Start Guide
1. Install Maestro: `brew install maestro`
2. Create your first test: `maestro init`
3. Run the test: `maestro test your_test.yaml`

## Setting Up Maestro in a Flutter Project

This guide covers setting up Maestro on macOS. While specific steps may vary slightly for Windows and Linux, most of the process should be similar across platforms.

## Prerequisites

Before setting up Maestro, make sure you have the following tools installed:

- **Flutter SDK**: Ensure you have Flutter installed and configured on your machine.
- **Android Studio**: Needed for Android emulators and SDK tools.
- **Xcode** (for macOS users): Required for iOS Simulator and iOS app building.
- **Maestro CLI**: Maestro requires its command-line interface for running UI tests.

## Installing Maestro CLI

You can check [official documentation](https://maestro.mobile.dev/getting-started/installing-maestro) for installation.

Here’s how to install it:

  ```bash
  brew tap mobile-dev-inc/tap
  brew install maestro
  ```

After installation, verify that Maestro is correctly installed by running:
```bash
maestro -v
```

## Commands

You can check for the commands from [here](https://maestro.mobile.dev/api-reference/commands). I could easily find every command I was looking for on this page. I can say that it meets all my needs.

## Arranging Flutter Widgets for Maestro

Maestro can interact with widgets that have semantics information attached. By default, this includes all widgets that display text (data in the Text widget, hintText in the TextField, and so on). You can also attach semantics information to any widget using Flutter's Semantics widget.

You can read more detailed information from [here](https://maestro.mobile.dev/platform-support/flutter).

Here is a simple widget example from [repo](https://github.com/islamoktay/flutter_ui_test_demo):

```dart
Semantics(
  identifier: 'website',
  child: GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () async =>
        LaunchService.launchWebsite('https://${user.website}'),
    child: Text(
      user.website ?? '',
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(decoration: TextDecoration.underline),
    ),
  ),
),
```

and you can tap on this widget by calling this in `yaml` file:

```yaml
- tapOn:
      id: "website"
```

## Writing Maestro Flows for Tests

Maestro tests are written in YAML files called **flows**. These flows define the sequence of actions Maestro should perform. Create a `ui_test` directory in the root of your Flutter project to keep these files organized.

### Basic Structure

Here’s a basic flow example (`ui_test/android_flow.yaml`):

```yaml
appId: com.example.flutter_ui_test_demo # your package name
---
- launchApp
- assertVisible: "Splash View"
- assertVisible:
      id: "posts-tab"
- assertVisible:
      id: "users-tab"
- scrollUntilVisible:
      element:
          id: "users3"
      direction: DOWN
- assertVisible:
      id: "users3"
- tapOn:
      id: "users3"
- tapOn:
      id: "website"
- assertVisible:
      id: "com.android.chrome:id/toolbar"
- tapOn:
      id: "com.android.chrome:id/close_button"
- tapOn: "Back"
- tapOn:
      id: "posts-tab"
- scrollUntilVisible:
      element:
          id: "post12"
      direction: DOWN
```

### Key Actions

1. **appId: com.example.flutter_ui_test_demo**
   - Sets the application ID for the app, so Maestro can identify and launch it.

2. **launchApp**
   - Launches the app specified by the `appId`.

3. **assertVisible: "Splash View"**
   - Verifies that the text "Splash View" appears, indicating a successful launch.

4. **assertVisible: id: "posts-tab"**
   - Confirms that the "Posts" tab is displayed on the screen.

5. **assertVisible: id: "users-tab"**
   - Ensures that the "Users" tab is also visible.

6. **scrollUntilVisible: element: id: "users3" direction: DOWN**
   - Scrolls down until the element with the ID `"users3"` is visible.

7. **assertVisible: id: "users3"**
   - Verifies the element with ID `"users3"` is visible after scrolling.

8. **tapOn: id: "users3"**
   - Taps on the element with the ID `"users3"` to open related details.

9. **tapOn: id: "website"**
   - Taps on the element to open a website link in the browser.

10. **assertVisible: id: "com.android.chrome:id/toolbar"**
    - Confirms that the Chrome browser toolbar appears, indicating the link opened successfully.

11. **tapOn: id: "com.android.chrome:id/close_button"**
    - Closes the browser to return to the app.

12. **tapOn: "Back"**
    - Uses the "Back" button to navigate to the previous screen.

13. **tapOn: id: "posts-tab"**
    - Switches to the "Posts" tab.

14. **scrollUntilVisible: element: id: "post12" direction: DOWN**
    - Scrolls down in the "Posts" tab until `post12` is visible.

### Detailed Flow Example

This flow simulates a comprehensive sequence of interactions within the app, including navigating between tabs, scrolling to specific elements, opening an external link, and returning to the app. Each step is designed to verify that various UI components function as expected in a realistic usage scenario. 

## Running Maestro Tests

At first you need to open an emulator.

Then you need build an `apk` file.

Then you need to install the `apk` to the emulator.

To execute your flow, use the following command:

```bash
maestro test ui_test/sample_flow.yaml
```

This command will run the specified flow on the connected device (or simulator) matching the `appId` defined in the YAML file.

Here is a full script for **android**:

```bash
AVD_NAME=$(emulator -list-avds | head -n 1) 

emulator -avd "$AVD_NAME" -netdelay none -netspeed full &
adb wait-for-device  

flutter build apk 

adb install build/app/outputs/flutter-apk/app-release.apk 

maestro test ui_test/android_flow.yaml 

DEVICE_ID=$(adb devices | grep emulator | cut -f1)
adb -s $DEVICE_ID emu kill  
```

### For iOS

You can also find `ui_test/ios_flow.yaml` and designated script in [example repo](https://github.com/islamoktay/flutter_ui_test_demo/blob/main/ui_test/run_ios_ui_test.sh). 

They are mostly same but has some differences. For example verifying the website and tap back on native side is different. As I said before, you can merge it into one `yaml` file but in my case I needed to make it separately. It is because our CI/CD pipeline works in different devices for each platform.

Here is an example for platform specific process if you want to merge it:

```yaml
- runFlow:
    when:
      visible: Some Text
      platform: iOS
```

## Maestro Studio

Maestro Studio is a graphical interface that helps simplify the setup and testing of mobile applications using the Maestro testing framework. It offers a visual way to create and run test flows, making it accessible to those who prefer not to write tests purely in code.

Here are the core features of Maestro Studio:

1. **Visual Test Creation**: You can create tests through a drag-and-drop interface, which allows you to define actions (like tapping buttons or entering text) and assertions (to check if specific elements are present or have expected values).

2. **Real-Time Testing**: It lets you connect a real device or emulator/simulator, so you can immediately see the results of the test steps you set up in the Studio. This real-time feedback helps in quickly identifying issues and adjusting tests.

3. **Code-Free Testing**: Since Maestro Studio handles most of the setup visually, you don’t have to write a lot of code, making it easier for non-developers to design and run tests.

4. **YAML Export**: After creating tests in the visual interface, you can export them as YAML files, which can be used as automated test scripts. This makes it easy to maintain the tests or integrate them into CI/CD pipelines.

Maestro Studio is a great tool for teams that want to improve their mobile testing process and make it more accessible across different roles, not just developers.

[![Maestro Studio Example](http://img.youtube.com/vi/g6HaT6CzUrk/0.jpg)](https://www.youtube.com/watch?v=g6HaT6CzUrk)

To use **Maestro Studio** with this YAML script, here’s a step-by-step guide on how to translate the actions into Maestro Studio’s visual interface, along with running and refining the test. This way, you can interactively create or verify each step in Maestro Studio before exporting it as YAML.

### Step 1: Launch Maestro Studio and Connect Your Device
   - Run Maestro Studio by typing:     
```bash
maestro studio
```
   - Open the browser window where Maestro Studio is running.
   - Ensure your device or emulator is connected and detected in Maestro Studio.

### Step 2: Recreate the YAML Script in Maestro Studio

1. **Launch the App**:
   - In Maestro Studio, select the action **"Launch App"** and specify the app ID as `com.example.flutterUiTestDemo`.
   - This launches the app on the connected device.
   - You can tap on the application directly from the given interface.
  
2. **Add Assertions for Initial Screen Elements**:
   - Select the **"Assert Visible"** action and enter `"Splash View"` to confirm the splash view appears.
   - Then, add assertions for the `"posts-tab"` and `"users-tab"` elements using their respective IDs.

3. **Scroll and Assert Visibility for the "users3" Element**:
   - Choose the **"Scroll Until Visible"** action, set the **element ID** to `"users3"`, and select the **direction** as `DOWN`.
   - After scrolling, add an **"Assert Visible"** action for `"users3"` to verify it’s on screen.

4. **Tap Actions to Interact with Elements**:
   - Select the **"Tap"** action and set it to tap on `"users3"`.
   - Repeat this for the **"website"** element ID to navigate to the website.

5. **Assertions and Taps on Website Screen**:
   - Add an **"Assert Visible"** action for `"TopBrowserBar"` to check if the browser bar appears.
   - Use **"Tap"** actions to tap on the `"Done"` button and then the `"Back"` button, returning to the main screen.

6. **Switch Tabs and Scroll to Specific Post**:
   - Tap the `"posts-tab"` to switch to the posts section.
   - Use **"Scroll Until Visible"** with the **element ID** set to `"post12"` and scroll direction as `DOWN`.

### Step 3: Run the Test Flow in Maestro Studio
   - After setting up each step visually in Maestro Studio, click **Run** to execute the test on the connected device.
   - Watch as each action runs in real-time, allowing you to make adjustments if needed.

### Step 4: Export the Test to YAML
   - Once you’re satisfied with the test flow, select the option to **Export to YAML** in Maestro Studio.
   - This will save the visual setup as a YAML file, matching your initial script and making it ready for automation.

### Step 5: Run the YAML with Maestro CLI (Optional)
   - To run the exported YAML script outside Maestro Studio, use the Maestro CLI:
```bash
maestro test path/to/your_test.yaml
```

This workflow lets you design, refine, and verify each step in Maestro Studio before finalizing the YAML for broader automation.

## Best Practices
- Keep test flows focused and atomic
- Use meaningful identifiers
- Structure tests hierarchically
- Implement proper waiting strategies
- Handle environment-specific configurations

## Source

- [Maestro Official Documentation](https://maestro.mobile.dev/) 
- [Example Repo](https://github.com/islamoktay/flutter_ui_test_demo) by Ahmet İslam Oktay
- [The power of open-source. Making Maestro work better with Flutter](https://blog.mobile.dev/the-power-of-open-source-making-maestro-work-better-with-flutter-d92b386f9a33) by Bartek Pacia