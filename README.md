BUILDME
===========

**A generic and KISS interface to any project's build process.**

The main benefits that BUILDME brings to a project:
----

* **New users** and active developers can easily and consistently build
 the project.
* Easy integration with Continuous Integration (CI) tools like GitlabCi,
 Jenkins or any other.
* Greatly simplify the management of multiple projects.
* The build process is auto documented by the BUILDME implementation.
* Since the BUILDME is evolving with the project (even if branched or
 forked)
 the build process may change anytime without any knowledge transfer
issue or out of date build process.
* Any missing external dependency are quickly reported to the user.
* Clean build free of any dirty state.
* Remove any possible human error from the build proces.
* Reproducible build.
* No need to learn a new programming language/syntax.
* Same build methodology if done locally or by a CI tool.

The BUILDME interface consist of a single executable file called
"BUILDME" which is put at the root folder of projects.  It shall accept
the command line parameters and comply with the requirements which are
described in details below.

There are absolutely no restriction about the BUILDME executable
implementation.  You may therefore choose any programming language.
You may implement your own BUILDME executable from scratch or use an
already implemented template available in the current project (Dash,
Python 3).  Even if there are no implementation restriction it is a
good idea to select an interpreted programming language since otherwise
a separated project to compile the BUILDME executable would then be
required.  Also interpreted language usually have the benefits of being
portable and human readable.

It is important to note that using this simple entry point to the build
process does not restrict the use of any build tools or compiler since
the build steps that it contains may very well call build tools like
ant, javac, gcc, grunt, make, maven, etc.

Projects should always aim to be free of any external (outside of the
source) dependencies but if it is not yet the case (it rarely is) the
BUILDME steps should validate the presence of all required external
dependencies and abort the build with clear instruction about the
missing ones on the build system.

Important Note
----

This solution introduces the concept of **One project = One output**.
If multiple outputs for a given project are possible, they should all be
generated **or** the project should be split/fork in multiple projects
with highly similar source code.

**As a convenience** to accomodate environment constraints some
facilitator files may be present in a project.  Some environment
constraints may be for example:

* OS requiring file extension to identify the executable nature
(```Windows```).

* IDE which have their own internal build methodology (pretty much all
of them).

* Continuous integration tool which require a special build file.
(```GitLabCI```).

It is important to note that facilitator purpose is only to
forward and delegate the build request to the BUILDME executable file
and shall therefore not implement any releasable build step.

**As a convenience** to accomodate or ease development workflows,
nothing prevent to have alternative methodologies to build or partially
build a project, **but** in the end only the output of the BUILDME shall
be used for final release.

Command line parameter interface:
----
The interface is shown below, you may notice that all the parameters are
optional.  Simply calling the BUILDME executable with no parameter
allows to validate build success without keeping the output.  Which is
usefull on continuous integration tools or to locally validate the build
successful status.


```
usage: BUILDME [-h] [-s SOURCE] [-t TEMP] [[-o OUTPUT]|[-O OUTPUT]] [-V]

Build the project

optional arguments:
  -h, --help
                      show this help message and exit
  -s SOURCE, --source SOURCE
                      source folder (Default: Current working directory)
  -t TEMP, --temp TEMP
                      temporary folder (Default: system temporary directory)
  -o OUTPUT, --output OUTPUT
                      output folder, shall already exist (Default: temporary directory)
  -O OUTPUT, --Output OUTPUT
                      output folder, shall not already exist (Default: temporary directory)
  -V, --version
                      show program's version number and exit

Exit code 0 only if the build is successful
```

Requirements
----

### The main idea behind BUILDME build process is that:
* Source folder is left untouched
* Build steps occurs in a temp folder
* The end result is put in an output folder.

This build behaviour is far from being revolutionary but what BUILDME
brings is a simple and standard interface to this build process.

Find below the exhaustive and complete list of requirements which
define every aspects of BUILDME.

* REQ00000 - Shall be an executable file called "BUILDME" (No extension) at the root of projects.
* REQ00001 - Shall exit with exit code "0" only if the build steps are all successful including the temporaty files cleaning.
* REQ00002 - Shall print out the command line parameter interface if the parameter "--help" is provided.
* REQ00003 - Shall print out the version of the BUILDME script if the parameter "--version" is provided.
* REQ00004 - Shall not do any build step if the parameter "--help" is provided.
* REQ00005 - Shall not do any build step if the parameter "--version" is provided.
* REQ00006 - Shall not do any build step if undefined parameters are given.
* REQ00007 - Shall not do any build step if the parameters "-s", "-t", "-o", "-O" are present more than once.
* REQ00008 - Shall not do any build step if both the parameters "-o" and "-O" are provided.
* REQ00009 - Shall use the folder provided by "-s" as the BUILDSOURCE.
* REQ0000A - Shall use current working directory as the BUILDSOURCE folder if "-s" is not provided.
* REQ0000B - Shall use the folder provided by "-t" as the TEMP folder.
* REQ0000C - Shall use the system wide temp folder and use it as the TEMP folder if "-t" is not provided.
* REQ0000D - Shall create a BUILDTEMP folder under TEMP.
* REQ0000E - Shall create the folder defined by the parameter "-O", this action is considered to be the first build step.
* REQ0000F - Shall use the folder provided by "-o" as the BUILDOUTPUT folder.
* REQ00010 - Shall use the folder provided by "-O" as the BUILDOUTPUT folder.
* REQ00011 - Shall create a folder under TEMP and use it as the BUILDOUTPUT folder if both "-o" and "-O" are not provided.
* REQ00012 - Shall not do any build step if any of the BUILDSOURCE, BUILDTEMP or BUILDOUTPUT folder are the same folder.
* REQ00013 - Shall not do any build step if any of the BUILDSOURCE, BUILDTEMP or BUILDOUTPUT folder is the child of BUILDSOURCE, BUILDBTEMP or BUILDOUTPUT folder.
* REQ00014 - Shall not do any build step if the folder defined by the parameter "-t" does not exist.
* REQ00015 - Shall not do any build step if the folder defined by the parameter "-s" does not exist.
* REQ00016 - Shall not do any build step if the folder defined by the parameter "-O" already exist.
* REQ00017 - Shall not do any build step if the folder defined by the parameter "-o" does not already exist.
* REQ00018 - Shall clean any data written within the TEMP folder by the build steps and nothing else, this action is done after all build steps.
* REQ00019 - Shall never skip the build step of cleaning the TEMP folder.
* REQ0001A - Shall not write any data outside of BUILDTEMP and BUILDOUTPUT folder.
* WSH00000 - Should abort build steps if the SOURCE folder is altered while the build steps are not complete.
* WSH00001 - Should abort build steps if an external dependency is missing on the system.
* WSH00002 - Should provide clear instruction in the output or error stream about any missing dependencies on the system.
* WSH00003 - Should be implemented in an interpreted programming language.
* WSH00004 - Should be portable accross multiple OS.
* OPT00000 - May read data under BUILDSOURCE.
* OPT00001 - May create, read, update, **process**, delete data in the BUILDTEMP folder.
* OPT00002 - May move or copy data to BUILDOUTPUT.
* OPT00003 - May write to the output and error stream.

Hint
----
When building on Ubuntu it is possible to build from RAM by using the **/run** folder as the temporary folder

```bash
./BUILDME -t /run/user/$UID/
```

Contribute
----
You are the welcome to contribute (Welcome in the open source world):
* Bug/Suggestion/Comment
* Other useful template implementations in a not already implemented
language (Fork and Pull).

Contact
----
* Project: https://github.com/elarivie/BUILDME
* Éric Larivière <ericlariviere@hotmail.com>

