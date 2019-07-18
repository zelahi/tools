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

Find all files and copy them to a directory
```
find {PATH_TO_SEARCH} -type f cp "{}" {DESTINATION_PATH} ";"

```

## Docker Command Examples:
Copy files from container to host
```
docker cp <container_id>:<path_to_dir> <path_to_dir>
```

## Sed
Strip all html elements from a list
```
sed -e 's/<[^>]*>//g' -i <filename>
```

## Curl
Download files with a specific extension
```
curl --silent --use-ascii --list-only https://download.docker.com/linux/static/stable/x86_64/ | grep .tgz
```
