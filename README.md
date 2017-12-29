Start container for gpx download or gpx merge:

docker run -i -e USERNAME=your_gc_user -e USERPASS=your_gc_pass -v /mnt/pq:/mnt/output --rm=true pqdocker pqmerge

docker run -i -e USERNAME=your_gc_user -e USERPASS=your_gc_pass -v /Volumes/GARMINSD/Garmin/gpx/:/mnt/output --rm=true pqdocker pqdown
