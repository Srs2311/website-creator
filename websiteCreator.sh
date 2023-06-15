#!/bin/bash
read -p "Website Name: " sitename
read -p "Install tailwind Y/N? " tailwind
echo "Creating" $sitename

#creates directories for website and copies boilerplate html
mkdir -p /home/$(whoami)/projects/websites/$sitename
cd /home/$(whoami)/projects/websites/$sitename
mkdir src
mkdir images
cp /home/$(whoami)/Scripts/websiteCreator/index.html ./src/index.html

#sets up CSS, either vanilla or tailwind depending on user input, then opens folder in vscode
if [ $tailwind = "y" ] || [ $tailwind = "Y" ] || [ $tailwind = "YES" ] || [ $tailwind = "yes" ] || [ $tailwind = "Yes" ]; then
    echo "Installing tailwind..."
    cp /home/$(whoami)/Scripts/websiteCreator/input.css ./src/input.css
    cp /home/$(whoami)/Scripts/websiteCreator/tailwind.config.js ./
    mkdir dist
    touch ./dist/output.css
    npm install -D tailwindcss
    npx tailwindcss init
    code ./
    npx tailwindcss -i ./src/input.css -o ./dist/output.css --watch
elif [ $tailwind = "n" ] || [ $tailwind = "N" ] || [ $tailwind = "no" ] || [ $tailwind = "NO" ] || [ $tailwind = "No" ]; then
    echo "Setting up CSS..."
    cp /home/$(whoami)/Scripts/websiteCreator/index.css ./src/input.css
    code ./
fi
