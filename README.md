# slack-prototype

## Dependencies

- Ruby version 2.2.2 or newer
- Redis
- Necessary gems via `bundle install`
- Amazon S3 user and bucket for local development

## Setup

Setup the local database:

```
$ rake db:setup
```

The app uses Amazon S3 when storing files both locally and in production. 
Create a `.env` file with the following variables in order to upload.

```
AWS_ACCESS_KEY_ID=xxxxx
AWS_SECRET_ACCESS_KEY=xxxxx
S3_BUCKET_NAME=your-bucket
```

## Running

Run `rails s` and visit `localhost:3000/`
