SHELL := /bin/bash

### Lint

lint: lint-md lint-md-link lint-md-spell lint-python

lint-md:
	$(info Starting markdownlint)
	markdownlint '**/*.md'

lint-md-link:
	$(info Starting markdown-link-check)
	find . -name \*.md -print0 | xargs -n 1 -0 markdown-link-check -c .markdownlinkcheck.json

lint-md-spell:
	$(info Starting mdspell)
	mdspell --en-us --ignore-acronyms --ignore-numbers  '**/*.md' --report

lint-python:
	$(info Starting flake8)
	flake8 ./src
	black --check -l 120 ./src

lint-shell:
	find ./scripts -name '*.sh' | xargs shellcheck -x

### Format

format-md-spell-interactive:
	$(info Starting interactive mdspell)
	mdspell --en-us --ignore-acronyms --ignore-numbers  '**/*.md'

format-python:
	black -l 120 ./src
