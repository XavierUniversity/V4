---
layout: page
title:  Template Structure
date:   2016-09-08 09:00:00
category: doc
order: 2
---

## Required Files/Folders

- `Gruntfile.js`: Establishes and defines Grunt related tasks (e.g. moving files; compiles sass; basic site init)
- `package.json`: Defines development-side dependencies to make `grunt` tasks work (e.g. compass; js linting)
- `bower.json`: Defines production-side dependencies required to make the site work (e.g. bootstrap; jquery; modernizr)
- `/_src/`: All development files are located in this folder; including js, scss and images; **Do not move, do not restructure**
- `/fonts/`: Where all of our fonts live, including Font Awesome
- `/stylsheets/`: Compiled CSS files; required naming convention for Campus Suite related items
- `/javascripts/`: Compiled and minified files; required naming convention for Campus Suite related items
- `/img/`: Compressed images from the `_src/img/`; all images should be processed
- `/includes/`: Houses any and all includes for ColdFusion based includes; vars and functions included