BUILDME
===========

**A generic and KISS interface to any project's build process.**

### The main idea behind BUILDME build process is that:
* Source folder is read from and left untouched
* Build steps occurs in a temporary folder
* The end result is put in an output folder.

This build behaviour is far from being revolutionary but what BUILDME
offers is a simple and standard command line interface to this build
process.

The BUILDME interface consists of a single executable file named
"BUILDME" which is at the root folder of projects. It shall provide
the following command line parameters and nothing more.


```
usage: BUILDME [-h] [-s SOURCE] [-t TEMP] [-o OUTPUT] [-V]

Build the project

optional arguments:
  -h, --help
                      show this help message and exit
  -s SOURCE
                      source folder (Default: Current working directory)
  -t TEMP
                      temporary folder (Default: system temporary directory or RAM temp folder when available)
  -o OUTPUT
                      output folder, shall not already exist (Default: temporary directory)
  -V, --version
                      show BUILDME version number and exit

Exit code 0 only if the build is successful including the temporary files cleaning.


```

All the parameters are optional. Calling the BUILDME executable with no
parameter allows to validate build success without keeping the output.

There are absolutely no restriction about the BUILDME executable
implementation. It may be implemented with any programming language.

Using BUILDME does not restrict the use of any build tools or compiler
since some build steps that it contains may very well call external
build tools like ant, javac, gcc, grunt, make, maven, npm, rake, etc…


Important Note
----

**As a convenience** to accommodate environment constraints some
facilitator files may be present in a project. Some environment
constraints may be for example:

* OS requiring file extension to identify the executable nature
(```Windows```).

* IDE which have their own internal build methodology (pretty much all
of them).

* Continuous integration tool which require a special build file.
(```GitLabCI```, ```TravisCI```).

Facilitator's files purpose are only to forward and delegate the build
request to the BUILDME executable file and shall therefore not implement
any releasable build step.

**As a convenience** to accommodate or ease development workflows,
nothing prevent to have alternative methodologies to build or partially
build a project, **but** in the end only the output of the BUILDME shall
be used for final release.


Contribute
----
You are the welcome to contribute (Welcome in the open source world):
* Bug/Suggestion/Comment
* Other useful template implementations in a not already implemented
language.

Contact
----
* Project: https://github.com/elarivie/BUILDME
* Éric Larivière <ericlariviere@hotmail.com>
