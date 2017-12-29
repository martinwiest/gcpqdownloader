## GCPQDOWNLOADER - get pocketqueries from geocaching.com directly to gps ##

Using Rick Richardson's Linux tools for geocaching http://geo.rkkda.com/ in a dockercontainer. 

Requieres: Docker Daemon

### Description: ###

Get a bunch of pocketqueries from geocaching.com at once an put them direct on a gps device without visit the webpage

As a non-windowsuser i was searching for a way to get a bunch of pocketqueries down from geocaching.com without visiting the page, download them step by step to my computer ( OSX driven )and finaly extract and copy them to my garmin. After some research i found the great Rick Richardson's Linux tools wich can do this and a lot of more things. But instead of compile and install them on my several machines i decide to put them in a docker-container. So i can use it on my OSX-machine and on the raspberry pi too.

### Build the container ####
Enter the cloned dir and build the container:
 
docker build -t pqdocker .

### Run the docker container ###

Examples:
Please edit the lines to your needs, like user, pass and the path to your gpx-dir on your gps. Next to lines show the commands for my Garmin Oregon 600 wich is plugged per USB to a MAC 

Getting all pocketqueries, extract and merge them to one file and upload it on the garmin:

docker run -i -e USERNAME=your_gc_user -e USERPASS=your_gc_pass -v /Volumes/GARMINSD/Garmin/gpx/:/mnt/output --rm=true pqdocker pqmerge

Getting all pocketqueries, extract them and upload it on the garmin:

docker run -i -e USERNAME=your_gc_user -e USERPASS=your_gc_pass -v /Volumes/GARMINSD/Garmin/gpx/:/mnt/output --rm=true pqdocker pqdown

If you would like to have the extracted queries on your pc, change the -v parameter to something like -v /home/myusername:/mnt/output
