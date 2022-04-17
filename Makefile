.ONESHELL:
.SHELL := /bin/bash
.PHONY: all serve test pdf docx

PORT       ?= 4000
THEME      ?= stackoverflow
BASE_DIR   ?= /docker
RESUME     ?= $(BASE_DIR)/resume.yaml
OUT_DIR    ?= $(BASE_DIR)/docs

RESUME_CLI := docker run \
				-v $(PWD):$(BASE_DIR) \
				-p $(PORT):$(PORT) \
				--rm -it resume-cli resume


# Check for necessary tools
ifeq (, $(shell which docker))
$(error "No docker in PATH, go to https://docs.docker.com/get-docker/, pick your OS, and follow the instructions")
endif

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

pdf: ## Export PDF format
	$(RESUME_CLI) export $(OUT_DIR)/resume.pdf \
		--theme jsonresume-theme-$(THEME) \
		--resume $(RESUME)

html: ## Export html format
	$(RESUME_CLI) export $(OUT_DIR)/resume.html \
		--theme $(THEME) \
		--resume $(RESUME)

# TODO: Fix yaml BUG
# serve: ## Run HTTP Server and edit from browser
# 	$(RESUME_CLI) serve --port $(PORT) --theme $(THEME) --resume $(RESUME)

test: ## Validate JSON Schema
	$(RESUME_CLI) validate --resume $(RESUME)

.DEFAULT_GOAL := help