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
	# install Neo3CppLib on demo/ folder
	rm -f demo/*.wasm
	cp -r thirdparty/neo-cpp-core/packages/lib-neopt-core-js/dist demo/

serve_demo:
	cd demo && python2 -m SimpleHTTPServer 9123

update_submodules:
	git submodule update --init --recursive
	git submodule update --recursive
