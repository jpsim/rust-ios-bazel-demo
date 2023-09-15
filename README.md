# Rust iOS Bazel Demo

https://github.com/jpsim/rust-ios-bazel-demo/assets/474794/4e6957b9-d38f-4f5c-891d-cb79c60cdc73

Requires having Xcode installed.

First generate and open the Xcode project:

```console
bazel run xcodeproj && xed .
```

Then build and run the ios_app target on a simulator.

This will build and run the mixed Rust / Swift iOS app source code.

To update the cargo dependencies, you can run
`CARGO_BAZEL_REPIN=true bazel build rust_lib`.

## Credits

I took inspiration from and used the following projects to set up this demo:

* https://github.com/bazelbuild/rules_rust
* https://github.com/bazelbuild/rules_swift
* https://github.com/keith/bazel-rust-mobile-demo
* https://github.com/MobileNativeFoundation/rules_xcodeproj
