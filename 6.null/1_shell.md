# Course overview + shell

1. Create a new directory called missing under /tmp.

```zsh
cd /tmp
mkdir missing
```

2. Look up the touch program. The man program is your friend.

```zsh
man touch
```

3. Use touch to create a new file called semester in missing.

```zsh
touch semester
```

4. Write the following into that file, one line at a time:

```
#!/bin/sh
curl --head --silent https://missing.csail.mit.edu
```

The first line might be tricky to get working. It’s helpful to know that # starts a comment in Bash, and ! has a special meaning even within double-quoted (") strings. Bash treats single-quoted strings (') differently: they will do the trick in this case. See the Bash quoting manual page for more information.

```zsh
echo '#!/bin/sh' > semester
echo 'curl --head --silent https://missing.csail.mit.edu' >> semester
```

5. Try to execute the file, i.e. type the path to the script (./semester) into your shell and press enter. Understand why it doesn’t work by consulting the output of ls (hint: look at the permission bits of the file).

```zsh
$ ./semester
zsh: permission denied: ./semester
$ ls -l semester 
-rw-rw-r-- 1 chronoby chronoby 61 Dec  8 21:02 semester
```

6. Run the command by explicitly starting the sh interpreter, and giving it the file semester as the first argument, i.e. sh semester. Why does this work, while ./semester didn’t?

```zsh
$ sh semester
HTTP/2 200 
server: GitHub.com
content-type: text/html; charset=utf-8
last-modified: Tue, 08 Dec 2020 04:42:52 GMT
etag: "5fcf044c-1e7e"
access-control-allow-origin: *
expires: Tue, 08 Dec 2020 12:35:26 GMT
cache-control: max-age=600
x-proxy-cache: MISS
x-github-request-id: 8688:517A:7F4465:8CE2EF:5FCF70B6
accept-ranges: bytes
date: Tue, 08 Dec 2020 14:01:47 GMT
via: 1.1 varnish
age: 0
x-served-by: cache-bur17521-BUR
x-cache: HIT
x-cache-hits: 1
x-timer: S1607436108.849002,VS0,VE115
vary: Accept-Encoding
x-fastly-request-id: 1aaa18552e9604fa64db0ee199a25e158bde2ee5
content-length: 7806
```

7. Look up the chmod program (e.g. use man chmod).

```zsh
man chmod
```

8. Use chmod to make it possible to run the command ./semester rather than having to type sh semester. How does your shell know that the file is supposed to be interpreted using sh? See this page on the shebang line for more information.

```zsh
chmod +x semester
```

9.  Use | and > to write the “last modified” date output by semester into a file called last-modified.txt in your home directory.

```zsh
touch ~/last_modified.txt
./semester | grep -i "last-modified" > ~/last_modified.txt
```

10.  Write a command that reads out your laptop battery’s power level or your desktop machine’s CPU temperature from /sys. Note: if you’re a macOS user, your OS doesn’t have sysfs, so you can skip this exercise.

```zsh
cat /sys/class/power_supply/BAT1/capacity
```
