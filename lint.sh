dart format test/ --set-exit-if-changed --fix
dart format lib/ --set-exit-if-changed --fix

STATUS_CODE=$?

if [ $STATUS_CODE -ne 0 ]; then
  echo "Please run 'dart format' to fix formatting issues."
  exit $STATUS_CODE
fi
