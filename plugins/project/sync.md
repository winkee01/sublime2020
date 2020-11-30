### SFTP
在 Win下用 Xftp 和 WinScp，被这种需要切换点击 or F5 刷新的手动操作蛋疼到无语；故此一遇见这 SFTP，顿觉这世界都美好了许多。

On windows, we ususally use Xftp and WinScp to sync file between remote and local, and the most inconvenient part is we need to switch between them and mannualy press F5 to refresh. This cumbersome work changes greatly after SFTP comes to rescue, simple press `ctrl + s` will sync local files to remote server.

please refer to: [Use SFTP in Sublime Text](blog.wpjam.com/m/sublime-text-2-sftp/)


### FTPSync
FtpSnyc is a sublime plugin to facilitate the sync job, but the configuration is a bit trival and not easy to go.

Here is a reference on [how to use FTPSync in sublime](http://liuwanlin.info/sublimeshi-yong-ji-ftpsyncyuan-cheng-tong-bu/)

I like to set password to null because I don't want to expose my password literally in config files. In that case, FTPSync asks me to type in password every time I save my files.

### Rsync
We can create a new build system in sublime text to utilize the rsync, then when we type `CMD + B` to execute the build, it will call rsync to sync our files to remote server.


**step 1)**
Write a script `sync.sh` which calls rsync:

```shell
#!/bin/bash
IP=server_ip
if test -z "$1"; then
    echo "Missing folder name argument."
else
    RSYNC_TO="root@$IP:./sc/$1"
    echo "Syncing from `pwd`/$1 to $RSYNC_TO"
    rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i ~/.ssh/id_rsa1"  --progress ./ $RSYNC_TO
fi
```

don't forget to add execution permission:

```shell
chmod +x sync.sh
```

You can save the script in your project root with dot name, and add it to `.gitignore` so that it won't mess up with your project files.


**step 2)**
create a new build system called **`sync_project`** that will call the `sync.sh` script

```
Tools > Build System > New Build System
```

save the new build system file as `sync_files.sublime-build` with the content:

```
{
    "cmd": ["./sync.sh", "$project_base_name"],
    "working_dir": "$file_path",
    "shell":  true,
}
```

**Note:**
This file should be saved into, in MacOSX, `$HOME/Library/Application Support/Sublime Text 3/Packages/User/sync_files.sublime-build`, so if you want to edit it after save, you should locate to this file.

**step 3)**
Set build system to your newly created build system **`sync_project`**.

```
Tools > Build System > sync_project
```

Open a file in your project and press `CMD + B` to sync the file or folder to remote server.


Note:
rsync can also be used to sync remote file to local, the useage is similar

```shell
rsync -avz root@remote_ip:/opt/media /opt/media/
```

**Options**

-a archive mode
-z compress
-v verbose
-e specify the remote shell to use
--delete delete remote file that is not in local host
--exclude=pattern_to_exclude
--include=pattern_to_include
--backup --backup-dir=/path/to/backups store backups of important files
--partial keep partial transferred files
--progress show progress
-P combine --partial and --progress

##### Errors

```
rsync: connection unexpectedly closed (8 bytes received so far) [sender]
rsync error: error in rsync protocol data stream (code 12) at /BuildRoot/Library/Caches/com.apple.xbs/Sources/rsync/rsync-52.200.1/rsync/io.c(453) [sender=2.6.9]
```
above error happens when you specify a remote path that doesn't exist.

### Browser Sync
