all:
	docker-compose -f srcs/docker-compose.yml up --build

# RUN IN DETACHED MODE
down:
	docker-compose -f srcs/docker-compose.yml down

re: stop all