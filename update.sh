#!/usr/bin/env bash

echo "Updating vscode settings"
cp ~/Library/Application\ Support/Code/User/settings.json ./vscode/settings.json

echo "Pushing to repository"
git add .
git commit -m "Updata"
git push

echo "Done"