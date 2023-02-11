#!/bin/bash -eu

cache=~/.cache/nice_light_off/value
mkdir -p $(dirname $cache)

case $1 in
off)
    start=$(light -G)
    start=${start%.*}
    echo $start > $cache
    end=0
    dir=-1
    ;;
on)
    start=0
    end=$(cat $cache)
    dir=1
    ;;
esac

for i in $(seq ${start} ${dir} ${end}); do
    light -S $i
done
