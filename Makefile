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
DOCKERFILE=php-7.2.Dockerfile
REGISTRY=
NAMESPACE=ezmid
IMAGE=vintage-php-fpm
IMAGE_NAME=$(NAMESPACE)/$(IMAGE)
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
	docker build . -t $(IMAGE_NAME):$(TAG)-$(VERSION) -f $(DOCKERFILE)

# Build/rebuild all images
.PHONY: build/all
.ONESHELL: build/all
build/all:
	docker build . -t $(IMAGE_NAME):7.0-$(VERSION) -f php-7.0.Dockerfile
	# docker build . -t $(IMAGE_NAME):7.0-debug-$(VERSION) -f php-7.0.Dockerfile
	docker build . -t $(IMAGE_NAME):7.1-$(VERSION) -f php-7.1.Dockerfile
	# docker build . -t $(IMAGE_NAME):7.1-debug-$(VERSION) -f php-7.1.Dockerfile
	docker build . -t $(IMAGE_NAME):7.2-$(VERSION) -f php-7.2.Dockerfile
	# docker build . -t $(IMAGE_NAME):7.2-debug-$(VERSION) -f php-7.2.Dockerfile
	docker build . -t $(IMAGE_NAME):7.2-base-$(VERSION) -f php-7.2-base.Dockerfile
	# docker build . -t $(IMAGE_NAME):7.2-base-debug-$(VERSION) -f php-7.2-base.Dockerfile
	docker build . -t $(IMAGE_NAME):7.3-$(VERSION) -f php-7.3.Dockerfile
	# docker build . -t $(IMAGE_NAME):7.3-debug-$(VERSION) -f php-7.2.Dockerfile
	docker build . -t $(IMAGE_NAME):7.3-base-$(VERSION) -f php-7.3-base.Dockerfile

# PHP 7.0
.PHONY: build/7.0
.ONESHELL: build/7.0
build/7.0:
	docker build . -t $(IMAGE_NAME):7.0-$(VERSION) -f php-7.0.Dockerfile
	# docker build . -t $(IMAGE_NAME):7.0-debug-$(VERSION) -f php-7.0.Dockerfile-debug

# PHP 7.1
.PHONY: build/7.1
.ONESHELL: build/7.1
build/7.1:
	docker build . -t $(IMAGE_NAME):7.1-$(VERSION) -f php-7.1.Dockerfile
	# docker build . -t $(IMAGE_NAME):7.1-debug-$(VERSION) -f php-7.1.Dockerfile-debug

# PHP 7.2
.PHONY: build/7.2
.ONESHELL: build/7.2
build/7.2:
	docker build . -t $(IMAGE_NAME):7.2-$(VERSION) -f php-7.2.Dockerfile
	# docker build . -t $(IMAGE_NAME):7.2-debug-$(VERSION) -f php-7.2.Dockerfile-debug

# PHP 7.2-base
.PHONY: build/7.2-base
.ONESHELL: build/7.2-base
build/7.2-base:
	docker build . -t $(IMAGE_NAME):7.2-base-$(VERSION) -f php-7.2-base.Dockerfile
	# docker build . -t $(IMAGE_NAME):7.2-debug-$(VERSION) -f php-7.2.Dockerfile-debug

# PHP 7.3
.PHONY: build/7.3
.ONESHELL: build/7.3
build/7.3:
	docker build . -t $(IMAGE_NAME):7.3-$(VERSION) -f php-7.3.Dockerfile
	# docker build . -t $(IMAGE_NAME):7.3-debug-$(VERSION) -f php-7.3.Dockerfile-debug

# PHP 7.3-base
.PHONY: build/7.3-base
.ONESHELL: build/7.3-base
build/7.3-base:
	docker build . -t $(IMAGE_NAME):7.3-base-$(VERSION) -f php-7.3-base.Dockerfile
	# docker build . -t $(IMAGE_NAME):7.3-debug-$(VERSION) -f php-7.3.Dockerfile-debug

################################################################################
# Push the image to registry
.PHONY: push
.ONESHELL: push
push:
	docker push $(IMAGE_NAME):$(TAG)-$(VERSION)

# Push all
.PHONY: push/all
.ONESHELL: push/all
push/all:
	docker push $(IMAGE_NAME):7.0-$(VERSION)
	# docker push $(IMAGE_NAME):7.0-debug-$(VERSION)
	docker push $(IMAGE_NAME):7.1-$(VERSION)
	# docker push $(IMAGE_NAME):7.1-debug-$(VERSION)
	docker push $(IMAGE_NAME):7.2-$(VERSION)
	# docker push $(IMAGE_NAME):7.2-debug-$(VERSION)
	docker push $(IMAGE_NAME):7.3-$(VERSION)
	# docker push $(IMAGE_NAME):7.3-debug-$(VERSION)

# Push 7.0
.PHONY: push/7.0
.ONESHELL: push/7.0
push/7.0:
	docker push $(IMAGE_NAME):7.0-$(VERSION)
	# docker push $(IMAGE_NAME):7.0-debug-$(VERSION)

# Push 7.1
.PHONY: push/7.1
.ONESHELL: push/7.1
push/7.1:
	docker push $(IMAGE_NAME):7.1-$(VERSION)
	# docker push $(IMAGE_NAME):7.1-debug-$(VERSION)

# Push 7.2
.PHONY: push/7.2
.ONESHELL: push/7.2
push/7.2:
	docker push $(IMAGE_NAME):7.2-$(VERSION)
	# docker push $(IMAGE_NAME):7.2-debug-$(VERSION)

# Push 7.2-base
.PHONY: push/7.2-base
.ONESHELL: push/7.2-base
push/7.2-base:
	docker push $(IMAGE_NAME):7.2-base-$(VERSION)
	# docker push $(IMAGE_NAME):7.2-base-debug-$(VERSION)

# Push 7.3
.PHONY: push/7.3
.ONESHELL: push/7.3
push/7.3:
	docker push $(IMAGE_NAME):7.3-$(VERSION)
	# docker push $(IMAGE_NAME):7.3-debug-$(VERSION)

# Push 7.3-base
.PHONY: push/7.3-base
.ONESHELL: push/7.3-base
push/7.3-base:
	docker push $(IMAGE_NAME):7.3-base-$(VERSION)
	# docker push $(IMAGE_NAME):7.3-base-debug-$(VERSION)

################################################################################
# Run a test
.PHONY: test
.ONESHELL: test
test:
	rm -f goss.yaml
	cp php-$(TAG)-goss.yaml goss.yaml
	@dgoss run $(IMAGE_NAME):$(TAG)-$(VERSION)

# Run a test
.PHONY: test/7.0
.ONESHELL: test/7.0
test/7.0:
	rm -f goss.yaml
	cp php-7.0-goss.yaml goss.yaml
	dgoss run $(IMAGE_NAME):7.0-$(VERSION)

# Run a test
.PHONY: test/7.1
.ONESHELL: test/7.1
test/7.1:
	rm -f goss.yaml
	cp php-7.1-goss.yaml goss.yaml
	dgoss run $(IMAGE_NAME):7.1-$(VERSION)

# Run a test
.PHONY: test/7.2
.ONESHELL: test/7.2
test/7.2:
	rm -f goss.yaml
	cp php-7.2-goss.yaml goss.yaml
	dgoss run $(IMAGE_NAME):7.2-$(VERSION)

# Run a test
.PHONY: test/7.2-base
.ONESHELL: test/7.2-base
test/7.2-base:
	rm -f goss.yaml
	cp php-7.2-base-goss.yaml goss.yaml
	dgoss run $(IMAGE_NAME):7.2-base-$(VERSION)

# Run a test
.PHONY: test/7.3
.ONESHELL: test/7.3
test/7.3:
	rm -f goss.yaml
	cp php-7.3-goss.yaml goss.yaml
	dgoss run $(IMAGE_NAME):7.3-$(VERSION)

# Run a test
.PHONY: test/7.3-base
.ONESHELL: test/7.3-base
test/7.3-base:
	rm -f goss.yaml
	cp php-7.3-base-goss.yaml goss.yaml
	dgoss run $(IMAGE_NAME):7.3-base-$(VERSION)
