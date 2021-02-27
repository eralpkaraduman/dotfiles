#!/usr/bin/env bash

echo "Updating vim settings"
cp ~/.vimrc ./vimrc

echo "Pushing to repository"
git add .
git commit -m "Update"
git push

echo "Done"
