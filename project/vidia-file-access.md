# Access to your home directory on VIDIA


## Browse your home directory

To browse the files in your VIDIA home directory, enter the 
following URL into a web browser, and supply your username and 
password when prompted:

https://vidia.ccr.buffalo.edu/webdav


## Cadaver client

To upload and download files, use the command-line cadaver client from your student workstation:

`$ cadaver https://vidia.ccr.buffalo.edu:443/webdav`

Enter your vidia username and password when prompted. You will have access to your home directory.

Once in, you can use [simple commands](https://www.cs.colostate.edu/helpdocs/ftp.html) like 'get', 'put', 'cd', and 'ls'
to upload, download, and browse your own directories and files.

Cadaver and the davfs2 package are installed on the student 
workstations and together enable webdav access from Linux.

### Example session

`$ cadaver https://vidia.ccr.buffalo.edu:443/webdav`
`Authentication required for WebDAV Server [vidia] on server 'vidia.ccr.buffalo.edu':`
`Username: myusername`
`Password: `
` `
`dav:/webdav/> ls`
`Listing collection '/webdav/': succeeded.`
`Coll:   R                                      0  Jun 13 11:40`
`Coll:   apps                                   0  Oct 14  2016`
`        sample-output.txt                   3199  Jun 22  2017`
` `
`dav:/webdav/> get sample-output.txt`
`Downloading '/webdav/pegtut/sample-output.txt' to sample-output.txt:`
`Progress: [=============================>] 100.0% of 3199 bytes succeeded.`
` `
`dav:/webdav/> bye`
`Connection to 'vidia.ccr.buffalo.edu' closed.`

Read more: https://vidia.ccr.buffalo.edu/kb/storage/webdav

