load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@rules_rust//rust:defs.bzl", "rust_library")
load("@crate_index//:defs.bzl", "all_crate_deps")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@rules_xcodeproj//xcodeproj:defs.bzl", "xcodeproj")

cc_library(
    name = "allocator_library",
    srcs = ["src/allocator_library.cc"],
    tags = ["manual"],
)

rust_library(
    name = "rust_lib",
    srcs = ["src/lib.rs"],
    edition = "2018",
    tags = ["manual"],
    deps = all_crate_deps(
        normal = True,
    ) + [":allocator_library"],
)

cc_library(
    name = "rust_c_wrapper",
    hdrs = ["src/rust_c_wrapper.h"],
    tags = [
        "manual",
        "swift_module=RustCWrapper",
    ],
    deps = [":rust_lib"],
)

swift_library(
    name = "app_lib",
    srcs = ["src/App.swift"],
    tags = ["manual"],
    deps = [":rust_c_wrapper"],
)

ios_application(
    name = "ios_app",
    bundle_id = "com.example.iosapp",
    families = ["iphone"],
    infoplists = ["src/Info.plist"],
    minimum_os_version = "16.0",
    visibility = ["//visibility:public"],
    deps = [":app_lib"],
)

xcodeproj(
    name = "xcodeproj",
    project_name = "Demo",
    tags = ["manual"],
    top_level_targets = [
        ":ios_app",
    ],
)
