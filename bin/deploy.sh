#!/usr/bin/env bash

# Build docker image

docker build -t mharrison/matt-harrison.com .

# Push docker image

docker push mharrison/matt-harrison.com

# Deploy on server

ssh matt-harrison.com bash <<EOF
    docker pull mharrison/matt-harrison.com:latest
    docker stop website
    docker rm website
    docker rmi mharrison/matt-harrison.com:current
    docker tag mharrison/matt-harrison.com:latest mharrison/matt-harrison.com:current
    docker run -p 80:2368 \
               -d \
               --name website \
               -v /src/data:/src/content/data \
               -v /src/images:/src/content/images \
               -e NODE_ENV=production \
               mharrison/matt-harrison.com:latest
EOF

echo "DONE :)"
