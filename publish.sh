#!/bin/bash

source .env


function publish_remote {
  # step 1: build
  docker run --rm -it -v $PWD/website:/src -p 1313:1313 -u hugo vijaymateti/hugo:latest hugo --minify

  # step 2: backup current site
  ssh $REMOTEHOST "tar cvzf $BACKUPPATH/web-$(date "+%Y%m%d-%H%M%S").tar.gz $WEBPATH/"

  # step 3: puslish files to server 
  rsync -av --delete --progress $PWD/website/public/* $REMOTEHOST:~/apps/web/
}

function publish_local {
  # step 1: build
  docker run --rm -it -v $PWD/website:/src -p 1313:1313 -u hugo vijaymateti/hugo:latest hugo --minify

  # step 2: backup current site
  tar cvzf $BACKUPPATH/web-$(date "+%Y%m%d-%H%M%S").tar.gz $WEBPATH/

  # step 3: puslish files to server 
  rsync -av --delete --progress $PWD/website/public/* $WEBPATH/
}


# run remote by default
if [ $1 = "local" ]; then
  echo "running local..."
  publish_local
else
  echo "running remote..."
  publish_remote
fi


