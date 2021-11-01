#!/bin/bash

USER=admin
HOST=000.000.00.000
DIR=/var/www/tddieselandparts.com

julia --project=. -e "using Franklin; optimize(clear=true, sig=true)" && rsync -avz --delete __site/ ${USER}@${HOST}:${DIR}

exit 0
