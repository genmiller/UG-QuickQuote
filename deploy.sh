#!/bin/bash

# Quick deploy script for UG Website

echo "📦 Staging changes..."
git add .

echo "💬 Creating commit..."
if [ -z "$1" ]; then
  # No message provided, use default with timestamp
  git commit -m "Update website - $(date '+%Y-%m-%d %H:%M:%S')"
else
  # Use provided message
  git commit -m "$1"
fi

echo "🚀 Pushing to GitHub..."
git push

echo "✅ Done! Your site will update in 1-2 minutes."
echo "🌐 https://genmiller.github.io/UG-QuickQuote/"
