#! /bin/bash
# Download mp3 with artist name + title
if  [[ $1 = "-n" ]]; then
	youtube-dl $2\
	--add-metadata --metadata-from-title "%(artist)s - %(title)s" \
	--extract-audio --audio-format mp3 --audio-quality 0 \
	--prefer-ffmpeg --youtube-skip-dash-manifest \
	--ignore-errors --restrict-filenames --verbose $f
	else
	youtube-dl $1\
	--add-metadata --metadata-from-title "%(artist)s - %(title)s" \
	--extract-audio --audio-format mp3 --audio-quality 0 \
	--embed-thumbnail --prefer-ffmpeg --youtube-skip-dash-manifest \
	--ignore-errors --restrict-filenames --verbose $f
fi
