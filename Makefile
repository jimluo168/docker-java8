current_version := 1.0.0-ubuntu16.04-java8
build:
	docker build -t registry.advanpro.cn/ubuntu-java-runtime:$(current_version) ./
