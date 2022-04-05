Editor settings

1   Overview
There are editors like Visual Studio Code <https://code.visualstudio.com>
and Notepad++ <http://notepad-plus-plus.org/>.
They are generic editors which contain presets for several programming languages.

The basic common settings for interoperability between different Operating Systems are:

    - Use only spaces for indentation
    - Use 4 spaces for indentation (de facto).
    - Use EOL end-of-line format LF (\n), not Windows CRLF (\r\n)
    - If the editor supports: enable auto-remove EOL whitespace on save
    - If the editor supports: ensure that the last line always contains EOL (POSIX standard).
    Usually you have to just remember to press RET at the last line.



2   Visual Code settings
Use menu “File > Preferences > Settings” or key C-, (control-comma) and search following settings:

    - Editor: [x] insert spaces
    - Editor: tab completion: [on]
    - Editor: tab size: 4
    - Files: EoL: \n (LF)
    - Files: [x] Trim Trailing Whitespace



3   Macbook Sublime settings
Use menu “Preferences > File Settings - User config” and write or modify following settings:

    "tab_size": 4
    "default_line_ending": "unix"
    “translate_tabs_to_spaces”: true
    "trim_trailing_white_space_on_save": true

All of the default options can be found in the "Preferences > Settings > Default". To customize any of them, copy the ones you care about into the User config.

More information:
https://granneman.com/webdev/editors/sublime-text/configuring-sublime-text



4   Settings indentation and TABs to spaces
The indentation in the default setting looks like four spaces but not what is saved to actual file.
The character which represents the indentation on the screen is the TAB (marked as \t in ascii code)
code in the actual file. You can see the difference if you use plain Windows notepad program to view
the results. In order to have no difference in actual file and screen, it is best to use plain space
characters everywhere. This helps with the interoperability problems e.g. if text is cut/pasted
elsewhere or file is edited using another editor.



Further Reading:
https://stackoverflow.com/questions/1446370/text-editor-which-shows-r-n