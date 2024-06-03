read -r -p 'Commit message: ' desc #prompt user to type commit message
git add . #treack all files
git commit -m "$desc" #commit with message
git push -u origin main #push to main
#the read -r allows to ask for commit message when you run script, then takes value and store into variable desc variable"