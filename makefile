all: build_package

build_package:
	npm run build

test:
	npm test

vendor: update_submodules cpp_core_deps_js
	@echo "Finished 'make vendor' successfully"

cpp_core_deps_js:
	cd thirdparty/neo-cpp-core/ && make vendor_js
	cd thirdparty/neo-cpp-core/packages/lib-neopt-core-js/ && make compile
	cd thirdparty/neo-cpp-core/packages/lib-neopt-core-js/ && make test

update_submodules:
	git submodule update --init --recursive
	git submodule update --recursive
