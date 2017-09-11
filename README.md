# TCP
TCP = [Total Commander](https://www.ghisler.com/) Paranoia. It is a program, that deletes all your search, renames and other history from Total Commander settings ini file. Specifically it removes this sections content from Total Commander setting ini file:

- SearchName,
- SearchIn,
- SearchText,
- Selection,
- RenameTemplates,
- RenameSearchFind,
- RenameSearchReplace,
- LeftHistory,
- RightHistory and
- MkDirHistory.

And you can edit this list in this software settings file TCParanoia.ini ($settings_file). You have to also add the path to your Total Commander setting ini file to source code file TCParanoia.au3 ($tc_ini). Then, if you wish, you can compile it to standalone executable .exe file by using [Aut2Exe](https://www.autoitscript.com/autoit3/docs/intro/compiler.htm).
