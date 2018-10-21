# selfeval
Determine whether students are ready to take CSCE 629, so they can decide whether to sign up.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, apply database migrations to both the dev and test databases:

```
$ bundle exec rake db:migrate
$ bundle exec rake db:migrate RAILS_ENV=test
$ bundle exec rake db:seed
```

Run rspec and cucumber tests to make sure everything is working:

```
$ rspec
$ cucumber
```

If the tests pass, you'll be ready to run the app in a local server:

```
$ rails server -p $PORT -b $IP
```
Admin
username: user@example.com
password: changeme

