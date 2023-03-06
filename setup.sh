# Disable google analytics of the code
dart --disable-analytics
# Ensure flutter 3.7.6 verstion and Dart 2.19.3
VERSION=$(flutter --version)
if [[ $VERSION == *"3.7.6"* ]] && [[ $VERSION == *"2.19.3"* ]]; then
    echo -e "\033[0;32mFlutter version is 3.7.6 and Dart version is 2.19.3\033[0m"
else
    echo -e "\033[0;31mFlutter version is not 3.7.6 or Dart version is not 2.19.3\033[0m"
    exit 1
fi

flutter pub get
flutter gen-l10n
./lint.sh