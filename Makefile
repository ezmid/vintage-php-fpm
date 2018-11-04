#!/usr/bin/make -f

# RUN WHOLE PROCESS IN ONE SHELL
.ONESHELL:

################################################################################
# Colors
################################################################################
# Are we running in an interactive shell? If so then we can use codes for
# a colored output
ifeq ("$(shell [ -t 0 ] && echo yes)","yes")
FORMAT_BOLD=\e[1m
FORMAT_RED=\033[0;31m
FORMAT_YELLOW=\033[0;33m
FORMAT_GREEN=\x1b[32;01m
FORMAT_RESET=\033[0m
else
FORMAT_BOLD=
FORMAT_RED=
FORMAT_YELLOW=
FORMAT_GREEN=
FORMAT_RESET=
endif

# Echo binary
ECHO=$(shell which echo)

################################################################################
# Specific project variables
################################################################################
DOCKERFILE=Dockerfile.7.2
REGISTRY=hub.docker.com
NAMESPACE=ezmid
IMAGE=vintage-php-fpm
TAG=7.2
VERSION=latest

################################################################################
# Manual
.ONESHELL: default
.PHONY: default
default: 
	@$(ECHO) -e "\n$(FORMAT_BOLD)VINTAGE MAKE TOOL$(FORMAT_RESET)\n" \
	"\n" \
	"$(FORMAT_YELLOW)Variables:$(FORMAT_RESET)\n" \
	"  REGISTRY:                    $(REGISTRY)\n" \
	"  NAMESPACE:                   $(NAMESPACE)\n" \
	"  IMAGE:                       $(IMAGE)\n" \
	"  TAG:                         $(TAG)\n" \
	"\n" \
	"$(FORMAT_YELLOW)Commands:$(FORMAT_RESET)\n" \
	"  make build                   Build the image\n" \
	"  make build TAG=1.1.0         Build a specific version of the image\n" \
	"  make test                    Test the image with Goss\n" \
	"  make test TAG=1.1.0          Test a specific version of the image with Goss\n" \
	"  make push                    Push the image to the registry\n" \
	"  make push TAG=1.1.0          Push a specific version of the image to the registry\n" \
	"\n"

################################################################################
# Build/rebuild the image
.PHONY: build
.ONESHELL: build
build:
	docker build . -t $(REGISTRY)/$(NAMESPACE)/$(IMAGE):$(TAG)-$(VERSION) -f $(DOCKERFILE)

# Build/rebuild all images
.PHONY: build/all
.ONESHELL: build/all
build/all:
	docker build . -t $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.0-$(VERSION) -f Dockerfile.7.0
	docker build . -t $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.0-debug-$(VERSION) -f Dockerfile.7.0-debug
	docker build . -t $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.1-$(VERSION) -f Dockerfile.7.1
	docker build . -t $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.1-debug-$(VERSION) -f Dockerfile.7.1-debug
	docker build . -t $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.2-$(VERSION) -f Dockerfile.7.2
	docker build . -t $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.2-debug-$(VERSION) -f Dockerfile.7.2-debug

# PHP 7.0
.PHONY: build/7.0
.ONESHELL: build/7.0
build/7.0:
	docker build . -t $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.0-$(VERSION) -f Dockerfile.7.0
	docker build . -t $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.0-debug-$(VERSION) -f Dockerfile.7.0-debug

# PHP 7.1
.PHONY: build/7.1
.ONESHELL: build/7.1
build/7.1:
	docker build . -t $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.1-debug-$(VERSION) -f Dockerfile.7.1
	docker build . -t $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.1-debug-$(VERSION) -f Dockerfile.7.1-debug

# PHP 7.2
.PHONY: build/7.2
.ONESHELL: build/7.2
build/7.2:
	docker build . -t $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.2-$(VERSION) -f Dockerfile.7.2
	docker build . -t $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.2-debug-$(VERSION) -f Dockerfile.7.2-debug

################################################################################
# Push the image to registry
.PHONY: push
.ONESHELL: push
push:
	docker push $(REGISTRY)/$(NAMESPACE)/$(IMAGE):$(TAG)-$(VERSION)

# Push all
.PHONY: push/all
.ONESHELL: push/all
push/all:
	docker push $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.0-$(VERSION)
	docker push $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.0-debug-$(VERSION)
	docker push $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.1-$(VERSION)
	docker push $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.1-debug-$(VERSION)
	docker push $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.2-$(VERSION)
	docker push $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.2-debug-$(VERSION)

# Push 7.0
.PHONY: push/7.0
.ONESHELL: push/7.0
push/7.0:
	docker push $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.0-$(VERSION)
	docker push $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.0-debug-$(VERSION)

# Push 7.1
.PHONY: push/7.1
.ONESHELL: push/7.1
push/7.1:
	docker push $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.1-$(VERSION)
	docker push $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.1-debug-$(VERSION)

# Push 7.2
.PHONY: push/7.2
.ONESHELL: push/7.2
push/7.2:
	docker push $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.2-$(VERSION)
	docker push $(REGISTRY)/$(NAMESPACE)/$(IMAGE):7.2-debug-$(VERSION)

################################################################################
# Run a test
.PHONY: test
.ONESHELL: test
test:
	@dgoss run $(REGISTRY)/$(NAMESPACE)/$(IMAGE):$(TAG)-$(VERSION)
