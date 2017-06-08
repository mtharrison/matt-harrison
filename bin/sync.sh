#!/usr/bin/env bash

## Gets latest images and data from live site

rsync -a matt-harrison.com:/src/images/ ./content/images
rsync -a matt-harrison.com:/src/data/ ./content/data
