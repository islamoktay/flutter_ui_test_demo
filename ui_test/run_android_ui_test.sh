AVD_NAME=$(emulator -list-avds | head -n 1) 

emulator -avd "$AVD_NAME" -netdelay none -netspeed full &
adb wait-for-device  

flutter build apk 

adb install build/app/outputs/flutter-apk/app-release.apk 

maestro test ui_test/android_flow.yaml 

DEVICE_ID=$(adb devices | grep emulator | cut -f1)
adb -s $DEVICE_ID emu kill  
