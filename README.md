# Tweeter 
![Tweet-Cron](https://github.com/doxsch/Tweeter/workflows/Tweet-Cron/badge.svg?event=schedule)

Tweeter is a github action, which is triggered every hour at 5 past. 
Afterwards a private repository is checked out, which contains scheduled tweets. Afterwards it is checked if there is a tweet scheduled for the current hour. If so, the tweet will be posted.

The structure of the private repository looks like this:

```bash
│   README.md
├───ideas
│       links.txt
│       notes.md
│
└───scheduled (contains sheduled Tweets)
    └───2020-05-19 (post date)
            20-20.png 
            20-20.tweet
```
The naming convention is as follows: The publication date is created as a folder in the format `YYYY-MM-DD`. Various `*.tweet` files can be stored in this folder, which are named according to the following convention: `<publishing hour>.<digit between 00 and 59>.tweet`. If there is a media file (supported formats **png, jpg, mp4**) with the same name as the `*.tweet` file, it will be published with the tweet. All tweets of the same hour are published simultaneously.
