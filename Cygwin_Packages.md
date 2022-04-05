WINDOWS / CYGWIN PACKAGES TO INSTALL

NOTE: Ignore any *-src (source code) or *-debuginfo* or "*-devel" packages.

    General

        nano        - editor, simple
        vim         - editor, heavy (*)
        emacs       - editor, heavy (*)
        joe         - editor, multiple (like "jmacs" lean Emacs)
        tree        - directory tree in ASCII graphics
        less        - pager program
        curl        - internet utility
        wget        - internet utility
        lynx        - text based browser: lynx -dump <http web address>
        mc          - midnight commander. ASCII GUI for file handling
        which       - display program location

    Version control and diff

        rcs         - version control software
        mercurial   - version control software
        git         - version control software
        subversion  - version control software
        patch       - patch(1) program
        wdiff       - word diff program
        diffstat    - lsdiff(1) and other comparision programs
        diffutils   - diff(1) and patch(1) programs

    Other utilities

        file        - file type detection utility
        gawk        - the AWK programming language
        zip         - archiver
        unzip       - unarchiver
        rsync       - file synchronization
        util-linux  - many additional programs
        findutils   - the find(1) program
        binutils    - development utulities
	    openssh     - remote connect: ssh(1) and scp(1) programs
        inetutils   - network utilities

    Databases

        sqlite3     - Standalone SQL database
	    mysql	    - DBMS database: client and server programs
	    postgresql  - DBMS database: client and server programs

    Programming languages

        make        - the make(1) program
	    perl	    - language
	    perl_pods   - manual pages
	    python3	    - language
	    ruby	    - language
        gcc-core    - GNU C
        gcc-g++     - GNU C++
        gdb         - GNU debugger

    Markup languages

	    python37-sphinx     - Sphinx
	    python37-markdown   - Markdown - markdown_py
	    asciidoc	        - Asciidoc
	    perldoc		        - included in "perl" - pod2man, pod2html, pod2text, pod2man
	    doxygen		        - doc block support for C/C++



CYGWIN HOME DIRECTORY

	cd		        - Go to $HOME directory
	cd ~		    - Go to (~) aka $HOME directory
	cd $HOME	    - got to location pointed by $HOME environment variable

	# Show Cygwin directory location in Windows
	explorer .	    - Start windows File Explored at current(.) directory



TERMINAL MINTTY

	https://mintty.github.io
	https://github.com/mintty/mintty/wiki

	Install Cygwin package:

	    mintty

        1. Make shortcut to Windows desktop from Cygwin install location

           <cygwin install dir>\bin\mintty.exe

        2. Modify shortcut > Properties (for <user>, see "echo $LOGNAME")

           mintty.exe --config /home/<user>/.minttyrc -e bash -l

        3. Write configuration file ~/.minttyrc

           BoldAsFont=no
           WindowShortcuts=no
           SwitchShortcuts=no
           ZoomShortcuts=no
           CopyAsRTF=no
           Term=xterm-256color
           FontSmoothing=default
           Locale=en_US
           Charset=UTF-8
           RightClickAction=paste
           SwitchShortcuts=no



CYGWIN PROGRAMS AND WINDOWS PATH

	In order to use Cygwin programs, like compilers and
	programming languages from Windows native programs, lik
	editors, the Cygwin path locations must be added to Windows
	PATH environment variable:

	    https://www.google.com/search?q=windows+10+environment+variables

	    [icon] W10 SEARCH
	    > [type] "environment"
	    > Tab:Advanced / Environment variables

	You can fnd your the location of the Cygwin binaries with:

	1. Start Cygwin Terminal

	2. Go to binaries locations:

	   cd /usr/bin
	   cd /usr/lib

	3. Start Windows explorer for each to check where they are located:

	    explorer .

	4. Add locations to the Windows Environment variable PATH



CYGWIN AND C/C++

	Install Cygwin packgages:

	    nano
	    gcc-core
	    gcc-g++

	1. Write program using editor (any editor will do):

	    nano <file>.cpp

	2. Save

	    ^O, Contol-o aka C-o to "Write out"

	3. Exit

	    ^X, Control-x aka C-x

	4. Compile in command line:

	    g++ <file>.cpp

	5. Run program (default compile output is "a.out" in Linux)

	    ./a.exe



CYGWIN AND JAVA

	Note: Java is not a "Cygwin package". Install standard Oracle
	Java SE for the Operating System.

	1. Download Oracle Java

	    https://www.oracle.com/java/technologies/downloads/

	2. Check Java installation location

	    ls "/cygdrive/c/Program Files/Java/"

		 jdk-14.0.2
		 jdk-17.0.1

	    # The lastest version of Java
	    ls "/cygdrive/c/Program Files/Java/jdk-17.0.1"

	2. Add Java location to ~/.bashrc

	    export JAVA_HOME="/cygdrive/c/Program Files/Java/jdk-17.0.1"
	    export PATH="$PATH:$JAVA_HOME/bin"

	3. Verify Java is available

	    <restart the terminal: close, open>

	    javac --help
	    java --help

	Mac users:

	    https://www.java.com/en/download/help/mac_install.xml

	Linux:

	    https://wiki.debian.org/Java
	    https://help.ubuntu.com/community/Java