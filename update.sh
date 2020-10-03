#!/usr/bin/env bash

echo 'Apps to update:'
brew outdated
brew outdated --cask
mas outdated

echo ' ' 
echo 'Updating Applications...'
    brew upgrade         
    brew update #Updating home-brew apps & formulas
    brew upgrade --cask #Updating apps installed as Casks
    mas upgrade #Updating Mac App Store Apps
    npm update #You know...

echo ' ' 
echo 'Cleaning caches & directories...'
    brew cleanup -s #Clearing home-brew cache

echo ' ' 
echo 'Updating Complete!'