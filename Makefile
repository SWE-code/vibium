.PHONY: all build deps clean clean-bin clean-cache clean-all help

# Default target
all: build

# Install dependencies and build
build: deps
	cd clicker && go build -o bin/clicker ./cmd/clicker

# Install npm dependencies (skip if node_modules exists)
deps:
	@if [ ! -d "node_modules" ]; then npm install; fi

# Clean clicker binaries
clean-bin:
	rm -rf clicker/bin

# Clean cached Chrome for Testing
clean-cache:
	rm -rf ~/Library/Caches/vibium/chrome-for-testing
	rm -rf ~/.cache/vibium/chrome-for-testing

# Clean everything (binaries + cache)
clean-all: clean-bin clean-cache

# Alias for clean-bin
clean: clean-bin

# Show available targets
help:
	@echo "Available targets:"
	@echo "  make             - Install deps and build (default)"
	@echo "  make deps        - Install npm dependencies"
	@echo "  make clean       - Clean clicker binaries"
	@echo "  make clean-cache - Clean cached Chrome for Testing"
	@echo "  make clean-all   - Clean binaries and cache"
	@echo "  make help        - Show this help"
