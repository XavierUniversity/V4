---
layout: page
title:  Dependency Install
date:   2016-09-08 09:00:00
category: doc
order: 0
---

Follow these steps to [install Homebrew and RBENV](https://gorails.com/setup/osx/10.11-el-capitan) (required for Mac OS X 10.11).

**The instructions below are based on Mac OSX 10.11 in case of link rot, use the above link if available.**

### Cloning and Initialzation

This process only needs to be completed once per machine the repository will be on, *do this prior to cloning the repo*. Once it's setup, you will only need to do minor maintenance to ensure your libraries are up-to-date.

Using terminal, `cd` to your working directory (where the repo will be housed locally) and run `git clone ssh/http url`, whichever flavor you are using.

### Optional Installation

A local copy of [ColdFusion](http://www.adobe.com/products/coldfusion-family.html) should be installed on your machine to enhance the development experience.

---

These instructions are a copy of the information on the [Homebrew and RBENV](https://gorails.com/setup/osx/10.11-el-capitan) install. Only use this info if the link above fails.

### Homebrew and RBENV Installation

[Homebrew](http://brew.sh) comes with a very simple install script. When it asks you to install XCode CommandLine Tools, say yes. Open Terminal and run the following command:

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

With Homebrew installed, install Ruby. `rbenv` will be installed to manage `ruby` and `gem`. Run the following commands in Terminal:

```
$ brew install rbenv ruby-build
```

#### Add rbenv to bash so that it loads every time you open a terminal

```
$ echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
$ source ~/.bash_profile
```

#### Install Ruby

```
$ rbenv install 2.2.3
$ rbenv global 2.2.3
$ ruby -v
```

### Install Compass

With `rbenv` installed, install [Compass](http://compass-style.org), run the following commands:

```
$ gem install compass
$ rbenv rehash
```

This will install `compass` and `rehash` the shims allowing executables to run correctly.

### Configuring Git

If you are using a Mac, you may already have Git. To find out, open a terminal and enter `git --version`.

```
$ git --version
git version 2.3.2
```

If you receive a version number, as shown in the previous example, great! You have Git already and can continue to the next step. If not, install Git.

If you run into issues while following these instructions, make sure you have root access (sudo) on the system where you want to install Git.

1. [Download the Git installer](http://git-scm.com/download/mac) from its official website.  
 - The installer is a DMG file. 
2. Double-click the DMG to expand it.
3. Double-click the PKG file to install it.
 - The Git installer launches.
4. Follow the prompts to install Git.
5. Open a terminal on your system.
6. Verify the installation was successful by typing `which git --version` at the command line.

```
$ git --version
git version 2.3.2
```

Depending on the version you install, the command line may return a different version.

#### Step 2. Save your information to Git

1. Configure your global username using the following command, replacing Emma's name with your own. Copy and paste the code after the $ and press enter.

    ```
    $ git config --global user.name "Emma Paris"
    ```

2. Configure your global email address using the following command, replacing Emma's email address with your own.

    ```
    $ git config --global user.email "eparis@xavier.edu"
    ```

Git uses the global email address for all your commits. Also, you can set this value per repository.

#### Accessing GitHub

Follow GitHub's [steps for setting up access](https://help.github.com/articles/set-up-git/) to pull from or push to remote repositories.


### Install Node.JS

[Node.js](https://nodejs.org/en/)® is a JavaScript runtime built on Chrome's V8 JavaScript engine. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient. Node.js' package ecosystem, npm, is the largest ecosystem of open source libraries in the world. Install Node.JS by running the following:

```
brew install node
```

### Install Bower

Bower is the dependency manager which can simply manage versions of various popular frameworks such as Bootstrap, jQuery and Modernizr. To get a better idea of what we are using, see the `bower.json` file, or the `vendor` folder after running `bower install`.

```
npm install -g bower
```

### Install Grunt.JS

Grunt.JS is a task runner. Grunt will automate our tasks for compiling SASS, minifying images, and linting, concatenating and minifying JS files. Grunt will also handle deployment.

```
npm install -g grunt-cli
```

