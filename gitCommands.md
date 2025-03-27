# Git commands

git init - Starts a new Git project in your current folder (makes it trackable)

git remote add origin https://github.com/teejMcSteez/ITSC3160Project/ - Tells Git, "Hey, this is the online repo I want to connect to" — you're giving your local Git a URL so it knows where to push/pull from.

git pull origin master - Downloads the latest code from the master branch of the remote repo to your local folder.


git checkout -b comaster - Creates a new branch called comaster and switches to it.

git add . - Tells Git to track all the changes in your current folder.

git commit -m "message" - Saves a snapshot of your changes with a message describing what you did.

git push origin master - Sends your committed changes up to GitHub into the master branch.

Remember -  If you're on comaster, pushing to master may not work unless you switch back first. 







