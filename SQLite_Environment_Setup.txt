SQLite Enviroment Setup

SOFTWARE - Windows Cygwin
1.0 Cygwin Linux Environment In Windows

    1.1 Cygwin documentation and setup              http://cygwin.com

        Download setup-x86_64.exe
        From time to time get new releases of this installer by downloading it again.

    1.2 Cygwin in a nutshell

        Cygwin is a set of programs and libraries ported from Linux to Windows.
        Essentially a "Linux distribution" as all the Software is idential.

        The "Cygwin terminal" provides anvironment that emulates Linux, but
        which can acces all of Windows at the same time.


            Windows     setup.exe       Cygwin mirror (packages)
               |           |                |
               |           |--------------->|
               |           |                |
               |<---------------------------|
             "Cygwin terminal"
             /cygdrive/c/

        NOTE: The Cygwin prefixes "/cygdrive/<DRIVE LETTER>" for Windows style paths.
        In addtion, the forward "/" slashes are used as in Linux for path delimiters.

    1.3 Setup.exe usage

        Select "default choices":

        1. Start setup.exe (x64)

        2. [x] Install from internet

        3, [x] All users

        4. Local package directory:
           C:\cygwin64 (example)

        5. [x] Direct connection

        6. Choose a download site: <SELECT CLOSE MIRROR *.fi *.se, *.de>
           Use HTTP protocol for best access.

        ... The program connects the site and read available LATEST package list
        ... From the opening package selection view...

        7. [top left] View: <FULL>

        8. [top left] Search: <TYPE "package", or "software", name here>

        9. When you select a LINE (package), in the MIDDLE (nead "src"), select
           DROP DOWN MENU for latest version number to install (like "1.21").

        ... Continue select MORE packages you want to get
        ... After you have selected list of packges, proceed to download
        ... by clicking [NEXT] button at the bottom.

        10. Review and confirm changes. Press [NEXT].
            Additional library dependencies are automatically selected for you.

        11. Wait until install finishes.
        ... end program

        12. Click desktop icon "Cygwin shell" or use Windows Menu
            Search: "Cygwin Shell" to start terminal screen.



1.1 Configure Cygwin Terminal
    ** NOTE: Terminal is not a Windows program.
    ** - Use cursor keys to move in editors. Mouse does not move point.
    ** - There are no Windows shortcut keys to copy (C-c) etc.

    A. Open terminal
        Click "Cygwin" icon on the Desktop

    B. In terminal command prompt, type command:
        nano ~/.minttyrc

    C. Write in editor (you cannot copy paste this):
        RightClickAction=paste

    D. Save and exit
        See instructions at the bottom of edior nano(1):

        Press ^O = Control-o aka C-o (Write Out)
        Press ^X = Control-x aka C-x (Exit)

    E. Restart terminal: Close and open it again

    F. In the restarted terminal, mouse should now work
        Mouse-1, i.e. Left-Mouse  = a selection is automatically copied
        Mouse-3, i.e. Right-Mouse = paste

        Note about naming: Mouse-2 would be the middle wheel button.

1.3 Cygwin Tips
A. THE $HOME DIRECTORY

The location of Cygwin $HOME directory can be seen by starting
the windows graphical user interface, the File Manager. Run
this command in terminal:

    explorer .

This opens Windows GUI to "current directory".

B. Edit files in Linux EOL (End of Line) format

If you edit any Cygwin files in using native Windows
editors like Visual Code or Notepad++, the editors must be
configured to write files in EOL format
LF (\n, line feed) characters.