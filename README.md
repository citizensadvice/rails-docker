# About this Repo

This is the Citizens Advice Ruby on Rails base docker image.
It uses the official docker ruby image as its base.

## Using this image

Create a Dockerfile in your Rails app project:

```dockerfile
FROM rails:onbuild
```

The Dockerfile should go into the root of your app directory.

The image contains `ONBUILD` triggers to include the app folder and install gems.

You can build and run the image:

```console
$ docker build --tag rails-docker .
$ docker run --name my-rails-app rails-docker
```

### Updating or generating Gemfile.lock file

Run the following command to update the Gemfile.lock in the root of your app directory:

```console
$ docker run --rm -v "$PWD":/app -w /app rails-docker bundle update
```

### Create a new rails application

To generate a new rails project:

```console
$ docker run -it --rm --user "$(id -u):$(id -g)" -v "$PWD":/app -w /app citizensadvice/rails new --skip-bundle app-name
```

This will create a sub-directory called app-name in your current directory.

### Updating this image

For when you need to update this image to a new Rails or Ruby version or changes to the `Dockerfile` script

1. Create a new branch with the name of the versions used in the format `{rails version}-ruby-{ruby version}{-extra}` e.g. `5.2.3-ruby-2.6.3` or `5.2.3-ruby-2.5.5-slim`
2. Push changes to github
3. Image built by docker-hub automatically
4. Create PR to `master`
5. Merge PR after approval and delete the branch
