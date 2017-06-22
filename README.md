# Script executor

Lightweight operating system image that downloads an arbritary shell script from a HTTP or NFS server, and executes it.

## Quick start (if using a binary build)

To tell the image to download the script from the HTTP server with IP-address 1.2.3.4 put in `cmdline.txt`:

`script=http://1.2.3.4/name-of-script.sh`

To tell the image to download the script from the NFS server with IP-addresses 1.2.3.4 use:

`script=1.2.3.4:/name-of-nfs-share/name-of-script.sh`

If using NFS the script has access to other files inside the same NFS share as well.
The current working directory is set to where the share is mounted before the script is executed.

## Documentation

[Building and customizing scriptexecutor](https://github.com/raspberrypi/scriptexecutor/wiki/Building-and-customizing)

