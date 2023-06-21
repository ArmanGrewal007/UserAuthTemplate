# Simple template for rails 7 - User Authentication

To run this, first you must have ruby installed in your system (ruby 2.6 comes pre-installed in Macs, but it is deprecated so
we need to install a new version)

### Steps to install Ruby and Rails
First install rbenv
```terminal
brew install rbenv
```
Add this line to .zshrc, to ensure rbenv is properly intialized when you open a new session 
```terminal
echo 'eval "$(rbenv init -)"' > ~/.zshrc
```
Show list of available ruby versions
```terminal
rbenv install -l
```
Install version of your choice, we are using **3.1.2**
```terminal
rbenv install 3.1.2
```
Set global version
```terminal
rbenv global 3.1.2
```
Install bundler gem (for handling gemfiles)
```terminal
sudo gem install bundler --no-document
```
Install rails gem (we are using **7.0.5**)
```terminal
sudo gem install rails --no-document
```

## Steps to run this repository
Open terminal and paste - 
```terminal
git clone https://www.github.com/ArmanGrewal007/UserAuthTemplate
```
```terminal
cd UserAuthTemplate
```
Start the rails server
```terminal
rails s
```
Now, head over to localhost:3000 and see the app running

## Some features of this app -->
1. Implemented Model-View-Controller architecture, under Rails' contraints ofcourse!
2. Separate pages for SignIn and SignUp
3. SQLite database at backend for storing users, with authentication using [https://en.wikipedia.org/wiki/Bcrypt](bcrypt)
4. Functionalities to edit password, reset password by mail
