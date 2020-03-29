When you create a project using

```
Project > Save Project As
```

Sublime Text will create two files for you: _`.sublime-project`_ and _`.sublime-workspace`_

the _`.sublime-project`_ file contains the project definition, and the _`.sublime-workspace`_ file contains user specific data, such as the open files and the modifications to each.

#### How to rename your project file name
If you change `myproj.sublime-project` to `newproj.sublime-project` and open the later in sublime, you will be prompted an error saying cannot find the project.

this is because the `.sublime-workspace` saves the reference to `myproj.sublime-project`, and when you open a project using new name `newproj.sublime-project`, sublime actually will also open `.sublime-workspace` and it can't find the old reference so it pops up errors.

so, we also need to change the old workspace file to `newproj.sublime-workspace` and the reference in it to `newproj.sublime-project`.


###### Reference
https://www.sublimetext.com/docs/3/projects.html