# oicusp
capture, log, and drop blackhole traffic to ocsp.apple.com


## Wat?

```
ln -s $PWD ~/.puma-dev/ocsp.apple
echo "127.0.0.1 ocsp.apple.com" | sudo tee -a /etc/hosts
```

```
$ sqlite3
SQLite version 3.28.0 2019-04-15 14:49:49
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite> .open oicusp.sqlite3
sqlite> select * from requests
   ...> ;
1|get|{"req"=>"true", "that"=>"there", "splat"=>["/hello-there-how-are-yuou"]}
```
