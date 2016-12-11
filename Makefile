currentdate = $(shell date +%y%m%d)

build:
	docker build -t napnap75/rpi-transmission:latest .

push: build
	docker push napnap75/rpi-transmission:latest
	docker tag napnap75/rpi-transmission:latest napnap75/rpi-transmission:$(currentdate)
	docker push napnap75/rpi-transmission:$(currentdate)
