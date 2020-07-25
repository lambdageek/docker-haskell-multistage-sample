
.PHONY: image run prune

image:
	docker build -t hw .

run:
	docker run --rm hw:latest

clean:
	docker image prune -f
