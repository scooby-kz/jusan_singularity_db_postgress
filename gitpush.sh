git add .

echo 'Enter the commit message:'
read commitMessage

git commit -m "$commitMessage"

#echo 'Enter the name of the branch:'
#read branch

#branch=$(git branch | cut -c3- | dmenu -p "Select the branch to push: ")
git push origin | git branch --show-current #$branch

read
