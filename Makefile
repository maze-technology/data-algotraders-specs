SMITHY_BUILD_DIR ?= build/smithy
SMITHY_MODEL_DIR ?= $(SMITHY_BUILD_DIR)/resolved/model

smithy-build:
	@smithy build --output $(SMITHY_BUILD_DIR)

generate-proto: smithy-build
	@mkdir -p build/generated/proto
	@smithytranslate smithy-to-proto --input $(SMITHY_MODEL_DIR) build/generated/proto

inject-protovalidate-validations:
	@python3 scripts/smithy-protovalidate/src/main/python/inject_protovalidate.py $(SMITHY_MODEL_DIR) ./build/generated/proto

buf-codegen:
	@if [ -z "$$(find build/generated/proto -name '*.proto' -print -quit)" ]; then \
		echo "No proto files generated; skipping buf generate"; \
	else \
		buf generate; \
	fi

build-gradle:
	@./gradlew build

build: generate-proto inject-protovalidate-validations buf-codegen build-gradle

format-smithy:
	@smithy format src/main/smithy

format: format-smithy

clean:
	@./gradlew clean

version:
	@./gradlew --version

upgrade:
	@if [ -z "$(GRADLE_VERSION)" ]; then \
		echo "Warning: GRADLE_VERSION is not set. Usage: make upgrade GRADLE_VERSION=X.Y.Z"; \
	else \
		./gradlew wrapper --gradle-version $(GRADLE_VERSION) --distribution-type all; \
	fi
