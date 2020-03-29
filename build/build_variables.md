
### Build System Variables
Build systems expand the following variables in .sublime-build files:

- **$file**               The full path to the current file, e. g., C:\Files\Chapter1.txt.
- **$file_path**          The directory of the current file, e. g., C:\Files.
- **$file_name**          The name portion of the current file, e. g., Chapter1.txt.
- **$file_base_name**     The name only portion of the current file, e. g., Document.
- **$file_extension**     The extension portion of the current file, e. g., txt.
- **$folder**             The full path to the first folder open in the side bar.
- **$packages**           The full path to the Sublime Text's Packages/ folder.


say you have a directory tree:

```
$HOME/site/
      ├── a.txt
      ├── b.txt
      ├── shell/
          └── test.sh
```

and suppose you have file `a.txt` open and focused, when you type `CMD + B` on it.

- **$file** is `$HOME/site/a.txt`
- **$file_path** is `$HOME/site`
- **$file_name** is `a.txt`
- **$file_base_name** is `a`
- **$file_extension** is `txt`
- **$folder** is `$HOME/site`
- **$packages** is `$/Library/Application Support/Sublime Text 3/Packages` for Mac OSX

Project variables are only available when you create a project file (e.g. `projname.sublime-project` in Sublime Text.

```
Project > Save Project As
```

- **$project**            The full path to the current project file.
- **$project_path**       The directory of the current project file.
- **$project_name**       The name portion of the current project file.
- **$project_extension**  The extension portion of the current project file.
- **$project_base_name**  The name only portion of the current project file.
- **$platform**           Windows, osx or linux.

Say, you save the project name as `$HOME/downloads/myproj.sublime-project`, the value of these variables will be:

- **$project** is `$HOME/downloads/myproj.sublime-project`
- **$project_path** is `$HOME/downloads/`
- **$project_name** is `myproj.sublime-project`
- **$project_base_name** is `myproj`
- **$project_extension** is `sublime-project`
- **$platform**           Windows, OSX or Linux.

**Plugin**
Install plugin **Project​Manager** to better manage your projects.


### Place Holders for Variables
Features found in snippets can be used with these variables. For example:

```
${project_name:Default}
```

This will emit the name of the current project if there is one, otherwise Default.

```
${file/\.php/\.txt/}
```