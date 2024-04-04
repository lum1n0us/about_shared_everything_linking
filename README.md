# about_shared_everything_linking

## About cases

[example](./example/) is a C version reproduction about [SharedEverythingLinking](https://github.com/WebAssembly/component-model/blob/main/design/mvp/examples/SharedEverythingDynamicLinking.md).

[link](./link) is from a test case of [wit-components crate](https://github.com/bytecodealliance/wasm-tools/tree/main/crates/wit-component/tests/components/link)

## About toolchain

assume that you have installed

- [wasi-sdk]() at _/opt/wasi-sdk-21.0/_
- [wasm-tools](https://github.com/bytecodealliance/wasm-tools) at _/opt/wasm-tools-1.201.0-x86_64-linux/_

## How to run

### example

```bash
$ cd example
$ ./build.sh
$ ls out
```

### link

```bash
$ cd link
$ ./build.sh
#$ ls out
```
