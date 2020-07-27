
.PHONY: image run prune

image:
	DOCKER_BUILDKIT=1 docker build -t hw --secret id=secretmodule,src=secrets/Secrets.hs .

run:
	docker run --rm hw:latest

clean:
	docker image prune -f
