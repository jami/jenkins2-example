
setup-docker:
	docker run -d -p 5000:5000 --restart=always --name registry registry:2
	docker run -d -p 2375:2375 -v /var/run/docker.sock:/var/run/docker.sock --restart=always --name socat sequenceiq/socat