#!/bin/sh

# the image file's path given as the first argument of the script
pathToMedia=$1
mediaMimeType=$(file -b --mime-type $pathToMedia)

pathToTweet=$( echo "${pathToMedia%%.*}.tweet")
tweetStatus=$(cat $pathToTweet)


# extract the size of the file
size=$(wc -c < $pathToMedia)

# delete leading and trailing white spaces
size=$(echo $size | sed 's/^[ \t]*//;s/[ \t]*$//')

# init the upload: media type and size
ans=$(twurl -H upload.twitter.com "/1.1/media/upload.json" -d ""command=INIT\&media_type=$mediaMimeType\&total_bytes="$size")


# extract the media id from the answer
medid=${ans%\"media_id_string\"*}
medid=${medid#*:}
medid=${medid%,}

# append to the upload: file's path and media id
ans2=$(twurl -H upload.twitter.com "/1.1/media/upload.json" -d ""command=APPEND\&media_id="$medid"\&segment_index=0"" --file $pathToMedia --file-field "media")

# finalize the upload
ans3=$(twurl -H upload.twitter.com "/1.1/media/upload.json" -d ""command=FINALIZE\&media_id="$medid")

# tweet the image
ans4=$(twurl -d "status=$tweetStatus&media_ids=$medid" /1.1/statuses/update.json)


