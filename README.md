
# Sample multi-stage `Dockerfile` for Haskell development

Based on https://github.com/phadej/docker-haskell-example but using
the `haskell:8.10` image rather than `ubuntu` for development, and deploying into `debian`.

There's a `Makefile` fragment with commands:

```console
$ make -f docker.make image # builds the image
$ make -f docker.make run # runs the container
$ make -f docker.make clean # delete dangling images
```
