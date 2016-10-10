# slack-prototype

## Dependencies

- Ruby version 2.2.2 or newer
- Redis (stable version)
- Necessary gems via `bundle install`

### Installing Redis

Run the following commands in order to install the latest stable version of Redis:

```
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
make install
```

## Setup

Setup the local database:

```
$ rake db:setup
```

## Running

Run `rails s` and visit `localhost:3000/`
