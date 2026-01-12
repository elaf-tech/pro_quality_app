#!/bin/bash

# تحديد الفرع الحالي
BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [[ "$BRANCH" == "main" ]]; then
  ENV="production"
elif [[ "$BRANCH" == "develop" ]]; then
  ENV="development"
else
  ENV="feature"
fi

# مثال: منع print في main
PRINTS=$(grep -r "print(" lib/ || true)

if [[ -n "$PRINTS" && "$ENV" == "production" ]]; then
  echo "❌ Found print() statements in production!"
  echo "$PRINTS"
  exit 1
fi

echo "✅ Team rules passed for $ENV branch"
