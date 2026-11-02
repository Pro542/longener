.PHONY: build-ec2 clean run deploy-ec2

# Build for EC2
build-ec2:
	mkdir -p build
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
	go build -o build/longener .

# local
run:
	go run .

test:
	go test ./...

clean:
	rm -rf build

# Deploy to EC2
deploy-ec2: build
	./deploy-ec2.sh
