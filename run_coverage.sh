echo "Running flutter test --coverage"
flutter test --coverage
echo "Running brew install lcov"
brew install lcov
lcov --remove coverage/lcov.info 'lib/di/*' 'lib/features/common/presentation/theme/*' -o coverage/new_lcov.info
echo "Running genhtml coverage/new_lcov.info -o coverage/html"
genhtml coverage/new_lcov.info -o coverage/html --show-details
echo "Done! coverage report summary is at coverage/html/index.html"
