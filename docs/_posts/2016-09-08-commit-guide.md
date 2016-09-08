---
layout: page
title:  Git Guidelines and Basic Usage
date:   2016-09-08 09:00:00
category: ref
order: 2
---

### GUI

If you are uninterested in learning the CLI commands here is a list of [GUI Git Clients](https://git-scm.com/download/gui/linux).

Sourcetree is developed by Atlassian (JIRA and Bitbucket developers). GitHub desktop is developed by, you guessed it, GitHub.

### (Very) Basic Commands

- `git status`: View the status of tracked or untracked files.
- `git add`: Add files to be tracked by repository
- `git commit`: Commit files to the repo history
- `git push`: Push files to a remote repository
  - This requires an `upstream`; This repo doesn't have one. It's all local.
- `git log`: View commit history and commit messages.

#### Git Add

`git add` requires a file, directory or `.` (all files). This needs to be
done whenever a new file is added to the structure OR whenever a file is
modified.

**Example:**

    git add readme.md

#### Git Commit

Git commit requires a message. Commit messages should be meaningful and use
the imperative, present tense. When using `git commit` in the command line
vi will open to add a commit message.

Imperative mood just means "spoken or written as if giving a command or instruction". Examples:

- Clean your room
- Close the door
- Take out the trash

Follow these steps to provide a detailed, but informative message.

1. Separate subject form body with a blank line
2. Limit the subject line to 50 characters
3. Capitalize the subject line
4. Do not end the subject line with a period
5. Use the imperative mood in the subject line
6. Wrap the body at 72 characters (just estimate)
7. Use the body to explain what and why vs. how

Example:

    Summarize changes in around 50 characters or less
    
    More detailed explanatory text, if necessary. Wrap it about 72
    characters or so. In some contexts, the first line is treated
    as the subject of the commit and the rest of the text as the body.
    The lank line separating the summary from the body is critical (unless 
    you omit the body entirely); various tools like `log`, `shortlog` and
    `rebase` can get confused if you run the two together.
    
    Explain the problem that this commit is solving. Focus on why you
    are making this change as opposed to how (the code explains that).
    Are there side effects or other unintuitive consequences of this
    change? Here's the place to explain them.
    
    Further paragraphs come after blank lines. 

    - Bullet points are okay, too
    - Typically a hyphen or asterisk is used for the bullet, preceded
      by a single space, with blank lines in between, but conventions
      vary here
    
    If you use an issue tracker, but references to them at the bottom,
    like this:
    
    Resolves: #123
    See also: #456, #789

A shortcut is `git commit -m "Commit message"`. The shortcut should only
 be used when describing simple situations. 

An example would be:
    
    $ git add index.html
    $ git commit -m "Add index page"

With issue tracking you can also use the commit message to resolve issues
within a short commit message:

    $ git add filename.ext
    $ git commit -m "Fix #IssueNo"

This commit message will close out the issue on the reporting tool (such as
BitBucket, Jira or GitHub's issue tracking tools).

To write your commit message and exit Vi press `esc`, `:wq`. `Esc` will take the cursor out of
edit mode. `:wq` will write the commit message and quit vi.

#### Git Push

Pushing with git requires a remote repository. In this particular example we will _not_ be using 
a remote repository. A remote could be:

- A local/network server hosting the `master` branch of a repository as the production environment
- A hosting service such as BitBucket or GitHub
- A local/networked git server running GitHub Enterprise or similar software

Example:

    $ git push origin master

This will push updates from the master branch to the remote origin established when setting up the local
repository.

#### Git Log

Git log will display the commit hash, author, date and commit message in reverse chronological order.
If there are numerous items, it will open in vi. Scroll using either the arrow keys or `ctrl+d`. 
To quit use `:q`.