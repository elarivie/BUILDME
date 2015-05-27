BUILDME
===========

**Generic interface to project's build process.**

With the availability of this simple entry point interface to the build
process of a project new user/developer will be able to build a project
very easily.  It also greatly simplify the management of multiple
projects with continuous integration tool for example.

The build interface consist of an executable file called "BUILDME" which
is put at the root folder of projects.  It shall accept the command line
parameters shown below (**nothing more, nothing less**) and comply with
the behaviours which are also described in details below.

There are no restrictions on the entry point executable implementation.
You may choose any already implemented template version available in the
current project or implement your own.  Even if there are no
implementation restriction it is a good idea to select an interpreted
language since otherwise a separated project for the build executable
would then be required.

Using this simple entry point to the build process does not restrict the
use of any build tools or compiler since the build steps that it
contains may very well call build tools like ant, javac, gcc, Grunt,
make, Maven, etc.  The project should aim to be free of any external
dependencies but if it is not yet the case the build steps should
validate the presence of all required external dependencies and abort
the build with clear instruction about the missing ones on the system.

Command line parameter interface:
----

```
usage: BUILDME [-h] [-s SOURCE] [-t TEMP] [[-o OUTPUT]|[-O OUTPUT]] [-V]

Build the project

optional arguments:
  -h, --help
                      show this help message and exit
  -s SOURCE, --source SOURCE
                      source folder (Default: Current working directory)
  -t TEMP, --temp TEMP
                      temporary folder (Default: new temporary directory
                      in the system temporary directory)
  -o OUTPUT, --output OUTPUT
                      output folder, shall not already exist (Default:
                      new temporary directory in TEMP)
  -O OUTPUT, --Output OUTPUT
                      output folder, shall already exist (Default: --output)
  -V, --version
                      show program's version number and exit

Exit code 0 only if the build is successful
```

Behaviour
----

* Shall abort if invalid parameters are given
* Should exit with an error if the given TEMP or OUTPUT folder is in the SOURCE folder
* Should exit with an error if an external dependency is missing on the system.
* Shall exit with an error if -o and -O are given
* With the option -o, Shall create the OUTPUT folder or exit with an error if it exists already
* With the option -O, Shall exit with an error if the folder does not exist already
* **Should build the project and put the result in OUTPUT**
* Shall only copy or move data to the OUTPUT folder (any kind of processing shall be done in the TEMP folder)
* Should exit with an error if the SOURCE folder content is modified
* Should remove generated data in the TEMP folder before exiting

Important Note
----
The behaviour of this solution does not allow partial build, they should
anyway be avoided to prevent potential invalid build output.

This solution introduces the concept of **One project = One output**.
If multiple outputs for a given project are possible, they should all be
generated **or** the project should be split/fork in multiple projects
with highly similar source code.

As a convenience some BUILDME executable with extension may be present
next to the main BUILDME file in a project repository.  Their function
is to offer a file with an extension to support operating systems that
requires one to identify the nature of the executable.  It is important
to note that those files objective is only to forward the execution to
the BUILDME file which have no extension and should not attempt to
implement the project build process.

Contribute
----
You are the welcome to contribute (Welcome in the open source world):
* Bug/Suggestion/Comment
* Other useful template implementations in a not already implemented
language (Fork and Pull).

Contact
----
* Project: https://github.com/elarivie/build
* Éric Larivière <ericlariviere@hotmail.com>

