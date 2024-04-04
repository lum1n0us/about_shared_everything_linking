#!/bin/bash

set -x

WASI_SDK_HOME=/opt/wasi-sdk-21.0
CLANG=${WASI_SDK_HOME}/bin/clang
SYS_ROOT=${WASI_SDK_HOME}/share/wasi-sysroot

WASM_TOOLS_BIN=/opt/wasm-tools-1.201.0-x86_64-linux/wasm-tools
OUT_DIR=./out

rm -rf ${OUT_DIR}
mkdir ${OUT_DIR}

echo "⚙️  c to WASM ..."

${CLANG} --target=wasm32-wasi -g -O3 -fPIC -shared -o ${OUT_DIR}/libzip.so ./libzip.c
${CLANG} --target=wasm32-wasi -g -O3 -fPIC -shared -o ${OUT_DIR}/zipper.so ./zipper.c

echo "⚙️  WASM to COMPONENT ..."

${WASM_TOOLS_BIN} component link -t -o ${OUT_DIR}/zipper.component.wat \
        --adapt ./wasi_snapshot_preview1.command.wasm \
        --dl-openable ${OUT_DIR}/zipper.so \
        libc.so=${SYS_ROOT}/lib/wasm32-wasi/libc.so \
        libzip.so=${OUT_DIR}/libzip.so

set +xe
