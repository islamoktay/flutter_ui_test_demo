# Flutter UI Test with Maestro Demo

## 1. Definition

This repository was created to perform UI testing with Maestro. We use [jsonplaceholder.typicode.com](https://jsonplaceholder.typicode.com) for API requests.

### Screens Overview
The app includes four main views:
1. **Splash View**
2. **Users View**
3. **User Detail View**
4. **Posts View**

### Test Flow
The UI test flow is as follows:

1. Verify that the **Splash View** is displayed.
2. Confirm that **Users** are listed on the **Users View**.
3. Navigate to a **User’s Detail View**.
4. Verify that the **User Detail** information is displayed.
5. Open the **website link** on the User Detail view.
6. Verify the website content in the User Detail view.
7. Return to the **Home View**.
8. Navigate to the **Posts View**.
9. Scroll down through the **Posts View**.
10. Confirm that **Posts** are visible.

### Additional Resources
- [Usage Guide](#) – Learn more about using this repository.
- [Maestro Documentation](https://maestro.mobile.dev/) – Access Maestro’s official documentation. 

## 2. Maestro

Maestro is built on learnings from its predecessors (Appium, Espresso, UIAutomator, XCTest)

- Built-in tolerance to flakiness. UI elements will not always be where you expect them, screen tap will not always go through, etc. Maestro embraces the instability of mobile applications and devices and tries to counter it.
- Built-in tolerance to delays. No need to pepper your tests with sleep() calls. Maestro knows that it might take time to load the content (i.e. over the network) and automatically waits for it (but no longer than required).
- Blazingly fast iteration. Tests are interpreted, no need to compile anything. Maestro is able to continuously monitor your test files and rerun them as they change.
- Declarative yet powerful syntax. Define your tests in a yaml file.
- Simple setup. Maestro is a single binary that works anywhere.

## 3. How to run UI tests

### Platform-Specific Test Flows

In this repository, the UI test flows for Android and iOS are separated in the `ui_test` directory. This structure is designed to simplify integration into CI/CD pipelines.

### Using the YAML Files

For detailed commands within these YAML files and integration steps:
- Refer to the [Usage Guide](#) article, or
- Check the official [Maestro Documentation](https://maestro.mobile.dev/).

### Test Flow Overview

The testing flow follows these general steps:
1. Start the **emulator/simulator**.
2. Prepare the **APK/IPA** package.
3. Upload the package to the **emulator/simulator**.
4. Run the **UI tests**.
5. Close the **emulator/simulator**.

### Running the Tests

To run both iOS and Android tests simultaneously, use the `run_ui_test.sh` script.

If you want to run tests separately, you can use the individual scripts provided in the `ui_test` directory.
