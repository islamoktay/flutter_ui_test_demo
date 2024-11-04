open -a Simulator --args -CurrentDeviceUDID 1DD5AB88-3EE5-4F02-B7EE-B2B45B317881

flutter build ios --debug --simulator

xcrun simctl install Booted build/ios/iphonesimulator/Runner.app

maestro test ui_test/ios_flow.yaml

osascript -e 'tell application "Simulator" to quit'
