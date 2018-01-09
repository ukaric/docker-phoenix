build:
    @docker build \
        -t kadza93/phoenix-starter .

push:
    @docker push codereviewvideos/docker-phoenix

bp: build push