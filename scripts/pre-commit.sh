#!/bin/sh

echo "Running pre-commit checks..."

# Check Formatting
echo "Creating formatting check..."
if ! dart format --output=none --set-exit-if-changed .; then
  echo "Error: Code is not formatted. Run 'dart format .'"
  exit 1
fi

# Check Analysis
echo "Running code analysis..."
if ! flutter analyze; then
  echo "Error: Code analysis failed. Please fix issues."
  exit 1
fi

# Run Tests
echo "Running tests..."
if ! flutter test; then
  echo "Error: Tests failed."
  exit 1
fi

echo "All checks passed!"
exit 0
