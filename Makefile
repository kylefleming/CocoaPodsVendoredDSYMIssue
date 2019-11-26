.PHONY: default
default: bootstrap build

.PHONY: bootstrap
bootstrap:
	bundle install

.PHONY: build
build: build_framework install_framework build_pods build_app

.PHONY: clean
clean: clean_framework clean_pods

.PHONY: build_framework
build_framework:
	(cd VendoredFramework && bundle exec fastlane run xcodebuild sdk:"iphonesimulator" arch:"x86_64")

.PHONY: install_framework
install_framework: VendoredFrameworkPod/Framework

VendoredFrameworkPod/Framework:
	cp -R VendoredFramework/build/Release-iphoneos/ VendoredFrameworkPod/Framework

.PHONY: build_pods
build_pods:
	(cd ClientApp && bundle exec pod install)

.PHONY: build_app
build_app:
	(cd ClientApp && bundle exec fastlane run xcodebuild scheme:"All" sdk:"iphonesimulator" arch:"x86_64")

.PHONY: clean_framework
clean_framework:
	rm -rf build ../VendoredFrameworkPod/Framework

.PHONY: clean_pods
clean_pods:
	rm -rf ClientApp/Pods
