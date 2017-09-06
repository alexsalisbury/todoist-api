<p align="center">
  <img src="https://developer.todoist.com/images/td_logo.svg" alt="Todoist API documentation for developers">
  <br><br>
  <a href="https://travis-ci.org/Doist/todoist-api"><img src="https://travis-ci.org/Doist/todoist-api.svg?branch=master" alt="Build Status"></a>
</p>

<br>

Getting Started
---------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 2.2.5 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle`
   command doesn't work, just run `gem install bundler` in a terminal.

### Contributing

1. Fork this repository on Github.
2. Clone *your forked repository* (not our original one) to your hard
   drive with `git clone
   https://github.com/YOUR_USERNAME/todoist-api.git`
3. `cd slate`
4. Initialize and start Slate. You can either do this locally, or with
   Vagrant:

```shell
# either run this to run locally
bundle install
bundle exec middleman server

# OR run this to run with vagrant
vagrant up

# OR run with docker
docker-compose up
```

You can now see the docs at http://localhost:4567.
Make your changes and submit a [pull request back to Doist](https://github.com/Doist/todoist-api/pulls).

### Pushing a new version

We use [slate](http://github.com/lord/slate) to build this project and it comes
with a `deploy.sh` script out of the box. We use it to deploy our documentation
to Github Pages.

In case you don't want to install the Ruby environment, you can use docker for
it:

    docker-compose run app ./deploy.sh --source-only

It will install all the dependencies needed for your environment and you can
push to Github pages by running:

    ./deploy.sh --push-only
