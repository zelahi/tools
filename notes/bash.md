## Grep:

Search for text in a group of files:
```
grep -r 'Some text' .
```

## Find:
Find all directories in current repository
```
 find . -type d
```

Find all Debian packages in a repo
```
find <path_to_dir> -type f -name "*.deb"
```

## Docker Command Examples:
Copy files from container to host
```
docker cp <container_id>:<path_to_dir> <path_to_dir>
```


## Delete notes from here onwards
/srv/debian/stretch/amd64

docker cp sleepy_jackson:/srv/debian/stretch/amd64/runc.io-dbgsym_0.20190515.003928~b9b6cc6e-1_amd64.deb .
docker cp sleepy_jackson:/srv/debian/stretch/amd64/runc.io_0.20190515.003928~b9b6cc6e-1_amd64.deb .
## Delete notes above this line
