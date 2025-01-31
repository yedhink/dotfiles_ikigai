#!/usr/bin/env bash
#
# Fetch song lyrics for mpd

artist=`mpc -f "[%artist%]" | head -n 1`
title=`mpc -f "[%title%]" | head -n 1`
			
url="https://lyrics.wikia.com/wiki/$artist:$title"
url="${url/\’/%27}"

lyrics="$(w3m -dump -T text/html "$url")"
lyrics="${lyrics/*'agreement with music Gracenote.'}"
lyrics="${lyrics/'External links'*}"
lyrics="${lyrics/'Written by:'*}"
lyrics="${lyrics/'Written '*}"
lyrics="${lyrics/'Music by:'*}"
lyrics="${lyrics/'Lyrics licensed'*}"
lyrics="${lyrics/'     '*}"

vim -c Limelight -c Goyo -- <(printf "%s\\n%s\\n" "$artist - $title" "$lyrics")
