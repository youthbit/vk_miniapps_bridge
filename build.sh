#!/bin/sh

cd flutter_app
flutter build web --release --web-renderer html
cd ..
cp -a ./flutter_app/build/web/* ./public