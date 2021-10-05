#!/bin/sh

# flutter doctor

flutter clean \
    && rm -fr ios/Podfile.lock pubspec.lock \
    && rm -rf ios/Pods ios/Runner.xcworkspace

cd ios
pod install
pod install
cd ..

flutter build ios --build-name=1.0.0 --build-number=1 --release --dart-define=MY_APP_ENV=prod

# icons
# flutter pub run flutter_launcher_icons:main 
