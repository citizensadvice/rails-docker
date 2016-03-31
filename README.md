# About this Repo

This is the Citizens Advice Ruby on Rails base docker image
It uses the official docker ruby image as it's base

## Using this image

Create a Dockerfile in your Rails app project

```dockerfile
FROM rails:onbuild
```

The Dockerfile should go into the root of your app direfctory.

The image contains `ONBUILD` triggers to include the app folder and install gems

You can build and run the image:

```console
$ docker build -t rails-app . 
$ docker run --name my-rails-app rails-app
```

### Generating a Gemfile.lock file

Run the following command to generate a Gemfile.lock in the root of your app directory:

```console
$ docker run --rm -v "$PWD":/app -w /app ruby:2.3.0 bundle install
```

### Create a new rails application

To generate a new rails project:

```console
$ docker run -it --rm --user "$(id -u):$(id -g)" -v "$PWD":/app -w /app citizensadvice/rails new --skip-bundle app-name 
```

This will create a sub-directory called app-name in your current directpry
