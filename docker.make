
.PHONY: image run prune

image:
	DOCKER_BUILDKIT=1 docker build -t hw .

run:
	docker run --rm hw:latest

clean:
	docker image prune -f
