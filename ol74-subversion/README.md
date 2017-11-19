# ol74-subversion

You can use it as your personal subversion to play with.
Once you boot strap the server the svn is available on 
`http://localhost:3690` it won't open in a browser.

You can test it with the below command.

```shell
curl http://localhost:3690
```
Next you can import your own repository from your local machine to it by the below command.

```shell
svn import ~/Documents/my-first-project svn://myserver:3690/my-first-project -m "Initial commit." --username robert --password hunter2
```

enjoy :)