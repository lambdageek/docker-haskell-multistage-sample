# syntax = docker/dockerfile:1.0-experimental
FROM haskell:8.10 as builder

WORKDIR /opt/build

RUN cabal update

COPY hw.cabal .

RUN cabal v2-build -v1 --dependencies-only all

COPY . /opt/build

RUN mkdir -p /opt/build/secrets

# XXX this will drop a tarball with the secret in it in dist-newstyle
RUN --mount=type=secret,id=secretmodule,dst=/opt/build/secrets/Secrets.hs cabal v2-install -v1 --installdir /opt/build/out --install-method=copy --enable-executable-static --overwrite-policy=always

RUN strip /opt/build/out/hw

RUN ls -lh /opt/build/out/hw

FROM alpine:3.12 as prod

WORKDIR /opt/hw

COPY --from=builder /opt/build/out/hw .

ENTRYPOINT ["/opt/hw/hw"]
