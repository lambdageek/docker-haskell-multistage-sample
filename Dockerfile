FROM haskell:8.10

WORKDIR /opt/build

RUN cabal update

COPY hw.cabal .

RUN cabal v2-build -v1 --dependencies-only all

COPY . /opt/build

RUN cabal v2-install -v1 --installdir /opt/build/out --install-method=copy --enable-executable-static --overwrite-policy=always

RUN strip /opt/build/out/hw

RUN ls -lh /opt/build/out/hw

FROM debian:buster-slim

WORKDIR /opt/hw

COPY --from=0 /opt/build/out/hw .

CMD ["./hw"]
