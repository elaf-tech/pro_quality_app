Write-Host "Running pre-commit checks..."

# Check Formatting
Write-Host "Checking formatting..."
$formatResult = dart format --output=none --set-exit-if-changed .
if ($LASTEXITCODE -ne 0) {
    Write-Error "Error: Code is not formatted. Run 'dart format .'"
    exit 1
}

# Check Analysis
Write-Host "Running code analysis..."
flutter analyze
if ($LASTEXITCODE -ne 0) {
    Write-Error "Error: Code analysis failed. Please fix issues."
    exit 1
}

# Run Tests
Write-Host "Running tests..."
flutter test
if ($LASTEXITCODE -ne 0) {
    Write-Error "Error: Tests failed."
    exit 1
}

Write-Host "All checks passed!"
exit 0
