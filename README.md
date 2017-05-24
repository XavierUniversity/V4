# Xavier University Template

This template is a baseline for developing the Xavier University template.

## Get Started

- Open Terminal on MacOSX
- Follow the steps to install Homebrew, Ruby and Configuring Git 
outlined at the [MacOSX 10.12 Instructions](https://gorails.com/setup/osx/10.12-sierra)
- Run `$ brew update` && `brew doctor`
  - Fix any issues outlined by the latter command. If no error, it should say "Ready to brew"
- Run `$ brew install node`
- Install Compass via `$ gem install compass`.
  - You may need to run this as  `$ sudo gem install compass`
- Run `rbenv rehash` to install the gem with the RBENV environment
- `ruby -v`, `node -v`, `npm -v` and `git -v` should all return a version number, not an error message. Verify this is the case
- If you followed the steps, Git should be configured by now. 
We should [connect via SSH](https://help.github.com/articles/connecting-to-github-with-ssh) to GitHub and BitBucket
  - SSH Allows you to not type a password with each update, making commits a bit faster
  - You can setup one key for both BitBucket and GitHub. Add it to both user accounts when you copy it

*Creating a Repository Folder*
- Start by typing `$ cd ~` to go to your user root
- `$ mkdir Sites && cd Sites` -- Make a sites director and Change Directory (`cd`) into it
- *Note:* This step can be done via a UI. `$ git clone git@github.com:XavierUniversity/V4.git`
  - This will clone the repo in the V4 folder within whatever folder you are currently in.
  - To find the folder you are in use `$ pwd`
  - To get back to your user Root type `$ cd ~`
- After the clone is complete, `cd V4`
- Then run `npm install` to install developer dependencies (see `package.json` for a list)
- Run `npm run grunt` -- Compiles code and starts a nodeJS Web server
  - If this command fails, run `npm install -g grunt-cli` You should be able to run the above command or `grunt` from the CLI
