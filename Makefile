create_docker:
	docker build -t helloapp:v1 .

run_docker:
	docker run -e USERNAME=$USERNAME helloapp:v1