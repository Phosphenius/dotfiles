build:
	docker build --tag luca/dotfiles .

run:
	docker run -it --rm -v $(shell pwd):/home/archuser luca/dotfiles
