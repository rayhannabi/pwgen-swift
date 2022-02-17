.DEFAULT_GOAL:= build

.PHONY: check build test docs clean

check:

build: check
	@swift build -v

test:
	@swift test -v

docs:
	@echo "Generating docs"

clean:
	@echo "Cleaning build directory"
	@rm -rf .build

lint:
	@swiftformat .
	@swiftlint 

