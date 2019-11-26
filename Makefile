recursive_wildcard = $(shell find "$(1)" -type f -or -type d 2>/dev/null)

FASTLANE = bundle exec fastlane
XCODEBUILD = $(FASTLANE) run xcodebuild

vendored_framework_build_root = VendoredFramework/build
vendored_framework_build_dir = VendoredFramework/build/Release-iphonesimulator
vendored_framework_install_dir = VendoredFrameworkPod/Framework
vendored_framework_sources = \
  $(call recursive_wildcard,VendoredFramework/VendoredFramework) \
  $(call recursive_wildcard,VendoredFramework/VendoredFramework.xcodeproj)

xcodebuild_simulator_args = sdk:"iphonesimulator" arch:"x86_64"
vendored_framework_xcodebuild_base_args = \
  project:"VendoredFramework/VendoredFramework.xcodeproj" \
  $(xcodebuild_simulator_args)
client_app_xcodebuild_base_args = \
  workspace:"ClientApp/ClientApp.xcworkspace" \
  scheme:"ClientApp" \
  $(xcodebuild_simulator_args)

.PHONY: default
default: bootstrap build

.PHONY: bootstrap
bootstrap:
	gem install bundler --conservative --no-document
	bundle install

.PHONY: build
build: build_framework install_framework build_pods build_app build_app_for_testing

.PHONY: clean
clean: clean_framework clean_pods

.PHONY: build_framework
build_framework: $(vendored_framework_build_dir)

.PHONY: install_framework
install_framework: build_framework $(vendored_framework_install_dir)

$(vendored_framework_build_dir): $(vendored_framework_sources)
	$(XCODEBUILD) $(vendored_framework_xcodebuild_base_args)
	@touch $@

$(vendored_framework_install_dir): $(call recursive_wildcard,$(vendored_framework_build_dir))
	@rm -rf $(vendored_framework_install_dir)
	cp -R $(vendored_framework_build_dir)/ $(vendored_framework_install_dir)

.PHONY: build_pods
build_pods:
	(cd ClientApp && bundle exec pod install)

.PHONY: build_app
build_app:
	$(XCODEBUILD) $(client_app_xcodebuild_base_args)

.PHONY: build_app_for_testing
build_app_for_testing:
	$(XCODEBUILD) $(client_app_xcodebuild_base_args) xcargs:"build-for-testing" raw_buildlog:true

.PHONY: clean_framework
clean_framework: clean_framework_build clean_framework_install

.PHONY: clean_framework_build
clean_framework_build:
	rm -R $(vendored_framework_build_root)

.PHONY: clean_framework_install
clean_framework_install:
	rm -R $(vendored_framework_install_dir)


.PHONY: clean_pods
clean_pods:
	rm -rf ClientApp/Pods
