#! /bin/bash
cp -r ~/.config/nvim/* ./nvimConfig
git add .
git commit -m "Updating NvimConfig through Script"
git push origin main
