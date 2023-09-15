# Rust iOS Bazel Demo

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
