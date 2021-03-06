YELLOW=\033[1;33m
NC=\033[0m

.DEFAULT_GOAL:= default

.PHONY: default tools format build test test.ci report docs clean

default: tools format build

tools:
	@./scripts/tools.sh

format:
	@echo "${YELLOW}Formatting${NC}"
	@swiftformat .
	@MODE=xcode ./scripts/lint.sh

build:
	@echo "${YELLOW}Building${NC}"
	@swift build -v

test:
	@echo "${YELLOW}Testing${NC}"
	@swift test -v

test.ci:
	@echo "${YELLOW}Testing (CI)${NC}"
	@./scripts/test.sh

report:
	@echo "${YELLOW}Generating coverage report${NC}"
	@./scripts/report.sh

docs:
	@./scripts/docc.sh

clean:
	@echo "${YELLOW}Cleaning up${NC}"
	@rm -rf .build
