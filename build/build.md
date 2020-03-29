### Build system

Tools > Build System > New Build System


```json
{
    "target": "build_system_input",
    "selector" : "source.c, source.cpp, source.c++",
    "cmd": ["clang++", "-std=c++11", "-Wno-c++98-compat-pedantic", "%flags%", "-Wall", "-o", "$file_base_name", "$file_name"],
    "windows": {
        "cmd": ["clang-cl", "-std=c++11", "-Wno-c++98-compat-pedantic", "%flags", "/Wall", "/o", "$file_base_name", "$file_name"]
    },
    "file_regex": "^(..[^:]*):([0-9]+):?([0-9]+)?:? (.*)$",
    "working_dir": "$file_path",
    "variants": [
        {
            "name": "Run Terminal",
            "shell_cmd": "clang++ -std=c++11 -Wno-c++98-compat-pedantic %flags% -Wall \"$file\" -o \"$file_path/$file_base_name\" && xterm -e '$file_path/$file_base_name; echo && echo Press ENTER to continue && read line && exit'",
            "windows": {
                "shell_cmd": "clang-cl -std=c++11 -Wno-c++98-compat-pedantic %flags% /Wall \"$file\" /o \"$file_path/$file_base_name\" && start cmd /k \"$file_base_name & pause && exit\""
            },
            "shell": true
        }
    ],
    "input": {
        "flags": "-Wno-newline-eof"
    }
}
```


https://www.sublimetext.com/docs/3/build_systems.html