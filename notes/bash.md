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
