# PhD Tools 

**_Helping struggling PhD students organise their life since 2020_**

<img alt="PhD Tools In Action" src="https://i.imgur.com/lhTHPcm.png">

PhD Tools provides a suite of assistive tooling and LaTeX/Google Docs templates to help PhD students to organise their projects and orchestrate their research papers productively.

The `phd` command line tool, written in bash, can help students coordinate a number of mundane tasks like:

* organising a PhD directory structure;
* creating new publications;
* organising those publications in a systematic way;
* preparing publications for arXiv preprints;
* providing linters and a word-counter for LaTeX;
* assisting with reviewer's feedback and comments.

PhD Tools is intended to bootstrap new PhD students who mightn't be sure how to organise their new academic life. It clones a structured [PhD template](https://github.com/alexcu/phd-template/wiki) to a location on your computer (synced to Google Drive), and keeps everything within that template nice and organised with a few commands.

PhD Tools is compatible with macOS, and works with **Google Drive** (to store Google Docs as well as all other necessary files) as well as **GitHub** (to store LaTeX files) and **Overleaf** (to edit LaTeX files). No backing up required!

## The `phd`command

PhD Tools provides a number of commands. 

Use the **`help` command** or append a **`-h` or `--help`** flag to learn more about a particular command.

### Commands to help you organise papers

Publications managed by PhD Tools assumes you are writing your work within a LaTeX-based repo, edited in Overleaf and hosted on GitHub.

#### About Pubkeys

A **pubkey** refers to a publication managed by PhD Tools that has a unique and systematically generated name, making it easy to know exactly what paper you are working on. A pubkey is typically just the abbreviation of the publication's intended venue followed by the year, like `icse2020` or `ieee-software2021`. PhD Tools provides a simple wizard to help you generate your pubkeys.

All pubkeys are flagged as `inprogress`, `abandoned`, `rejected`, or `published`; flags are entirely interchangeable.

PhD Tools provides the following commands to assist with writing papers.

#### Starting a new paper

```bash
$ phd newpub [pubkey]
```

To rapidly get started with writing a paper, this command will create a new GitHub repository for the paper based on a [bootstrapping template](https://github.com/alexcu/papers-template) compatible with major IEEE and ACM venues. It will also help orchestrate a new Overleaf project (for writing LaTeX content in) and sync the GitHub and Overleaf project between accounts.

If no pubkey is provided, then a wizard will help you make one. 

#### Renaming a paper (to a new pubkey)

```bash
$ phd renamepub oldpubkey [newpubkey]
```

In the event you wish to change your pubkey, this command will help rename the main LaTeX file you are working on, the GitHub repo and the Overleaf project. If no new pubkey is provided, then a wizard will help you make one.

#### Cloning a paper

```bash
$ phd clonepub pubkey [newpubkey]
```

This command will duplicate an existing paper to a new one, which is handy if you want to re-pitch your work elsewhere. It will help clone the existing repo to a new name and create a new GitHub repo and the Overleaf project with the new name. If no new pubkey is provided, then a wizard will help you make one.

#### Flagging a paper

```
$ phd flagpub pubkey [abandoned|inprogress|published|rejected]
```

This command will mark a publication (i.e., with a status) to indicate whether the paper is in progress, abandoned, rejected or published. It does this by storing the paper in the relative subdirectories within the `Papers` directory.

#### arXiving a paper

```bash
$ phd arxivpub pubkey
```

In the event that you're ready to push your work onto a preprint server, like arXiv, then PhD Tools can help. It merges all LaTeX files (using TeX's `\input` command) into one main file, removes all comments (since TeX source is public on arXiv) and prepares `.bbl` files to be downloaded from Overleaf. Finally it ZIPs everything up for you ready to be uploaded.

#### Handling reviewer feedback

```bash
$ phd review pubkey
```

When you receive a peer-reviewed feedback email, you can ask PhD Tools to help begin breaking down the massive email. It will clone a [reviewer template](https://docs.google.com/spreadsheets/d/1_HWrqVFU-W8_mq_OHjr4h2wzBfMor7yjy3rcX-Cs_JU/template/preview) and provides [instructions](https://github.com/alexcu/phd-template/wiki/Reviews#a-workflow-for-going-through-feedback) on how to go through all reviewer's concerns. Further, PhD Tools can help archive the reviewer email for future reference in case you lose it by storing the email's `.eml` file within your Google Drive.

#### Writing authorship statements

```bash
$ phd author pubkey
```

As PhD Tools is written for Deakin University students, all publications within candidature should have a written [Authorship Statement](https://docs.google.com/document/d/1LDKBHWtG_LV8v0TPnjjtPMAiorSfe4-B6njSHXIhdyY/template/preview) outlining what each co-author did and signed at the time of the publication acceptance. The command helps produce an authorship statement (via Google Docs) for the provided pubkey and places it in the appropriate directory on Google Drive.


### Commands to help you write

#### Linting LaTeX

```bash
$ phd lint [dups|tlas|passive|weasel] [pubkey|file.tex]
```

You can ask PhD Tools to lint your writing by using one of the linters below:

* `dups` - scan your paper for duplicate words (which are often hard to spot amongst a massive body of LaTeX source);
* `tlas` - scan your paper for overused or undefined Three Letter Acronyms;
* `passive` - scan your paper for overuse of the passive voice;
* `weasel` - scan your paper for weasel words.

You can provide a specific LaTeX file to line or provide a pubkey, which will use the main LaTeX file for that pubkey and recursively scan all sub-files included using the `\input` LaTeX command.

#### Counting words

```bash
$ phd wordcount [pubkey|file.tex]
```

This command helps you produce a word-count of an entire LaTeX file, including recursive files included via LaTeX's `\input` command. It breaks the word-count down to each (sub)(-sub)section.

### Other commands

#### Generate meeting minutes

```bash
$ phd meeting [yyyy-mm-dd]
```

This command helps you produce a meeting minutes template and keeps it stored in the `Meetings` folder under Google Drive.

#### Keeping PhD Tools up-to-date

```bash
$ phd update
```

PhD Tools doesn't check for its own updates, so it's advisable you run this command to update and check your version using:

```bash
$ phd version
```

which will also tell you the current version of the tools.

#### Opening your PhD directory

```bash
$ phd open
```

PhD Tools keeps everything stored in a structured way (see below). You can open your PhD directory (synced to Google Drive) by using this above command.

## The PhD Directory

PhD Tools provides a template PhD directory to help you keep all your files organised:

```
.
├── Admin
│   ├── Authorship Statements
│   ├── Candidature Review
│   │   ├── Year1CoC
│   │   ├── Year2
│   │   └── Year3
│   ├── Examination
│   ├── Scholarships
│   └── Travel
├── Coursework
├── Data
├── Ethics
├── Experiments
├── Feedback
├── Meetings
├── Papers
│   ├── abandoned
│   ├── arxiv
│   ├── inprogress
│   ├── published
│   ├── rejected
│   └── thesis
├── Presentations
├── Reviews
├── Scratch
├── Scripts
└── Writing
```

You can learn more about the purpose of each of these directories by visiting this [wiki](https://github.com/alexcu/phd-template/wiki).

## Installation

### Before you install...

Before installing, please ensure you are signed up to the following services:

* Either a managed GSuite account by your institution or a personal Google Drive account;
* A GitHub account;
* An Overleaf account.

You will also need the the following software installed:

* For GSuite users, you should have the Google Drive File System installed ([download here](https://dl.google.com/drive-file-stream/googledrivefilestream.dmg));
* For Google Drive users, you should have the Google Drive Backup and Sync application installed ([download here](https://dl.google.com/drive/InstallBackupAndSync.dmg)).

Please note that PhD Tools is (currently) made for **macOS users only (tested in macOS 11)**.

### How to install...

Installing PhD Tools is as easy as:

```bash
$ PHD_INSTALLER=0 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/alexcu/phd-tools/master/phd)" 
```

Note that PhD Tools will also download the [Homebrew package manager](https://brew.sh), the [GitHub CLI](https://github.com/cli/cli) tool, and the [coreutils](https://www.gnu.org/software/coreutils) package (via brew).

## Contributing

PhD Tools is still early days and the best way you can contribute to it is to play around with it and provide feedback.

If you discover any bugs, please feel free to raise an issue on GitHub.

## Third Party Software

The linter scripts provided in this repo are based on Matt Might's [code](http://matt.might.net/articles/shell-scripts-for-passive-voice-weasel-words-duplicates/). The word counter is a perl script provided by [TeXCount](https://app.uio.no/ifi/texcount/index.html).
