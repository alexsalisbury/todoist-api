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

### Documentation structure

This repository contains the documentation for the [Sync
API](https://developer.todoist.com/sync) and the beta [REST
API](https://developer.todoist.com/rest). The main files for the
documentation located under the `source` directory:

+ source/sync/v7/index.html.md
+ source/rest/v8/index.html.md

We keep the documentation versions until they are completely removed
and stop working. The files mentioned above are the main file for the
documentation and include all the others available under
`source/includes/`:

+ source/includes/sync/v7/_items.md
+ source/includes/sync/v7/_projects.md
+ source/includes/sync/v7/_labels.md
+ source/includes/rest/v8/_tasks.md
+ source/includes/rest/v8/_projects.md
+ source/includes/rest/v8/_labels.md

Following the same structure as the main file, we keep the versions
for all includes. These are the files you will have to change to
update the documentation.

### Making your first change

You can bootstrap the documentation yourself by installing `ruby`,
`bundler`, and the gems available in the `Gemfile` via `bundle
install` but **we recommend docker** for the simplicity sake.

To get the documentation running, just build the container:

```
docker-compose build
```

and run it:

```
docker-compose up
```

And you will be ready to change the documentation and check your changes at `http://localhost:4567`

### Pushing a new version

We use [slate](http://github.com/lord/slate) to build this project and it comes
with a `deploy.sh` script out of the box. We use it to deploy our documentation
to Github Pages.

In case you're using docker, we recommend to split the build in two
separate steps. First, build the documentation using docker for ruby
related tasks:

    docker-compose run app ./deploy.sh --source-only

And then, use your git configuration to push the changes to Github pages:

    ./deploy.sh --push-only
