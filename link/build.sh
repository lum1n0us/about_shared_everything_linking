#!/bin/bash

set -x

WASM_TOOLS_BIN=/opt/wasm-tools-1.201.0-x86_64-linux/wasm-tools
OUT_DIR=./out

rm -rf ${OUT_DIR}
mkdir ${OUT_DIR}

echo "⚙️  WAT to WASM ..."

${WASM_TOOLS_BIN} parse -o  ${OUT_DIR}/lib-c.wasm ./lib-c.wat
${WASM_TOOLS_BIN} parse -o  ${OUT_DIR}/lib-foo.wasm ./lib-foo.wat
${WASM_TOOLS_BIN} parse -o  ${OUT_DIR}/lib-bar.wasm ./lib-bar.wat

echo "⚙️  WASM to COMPONENT ..."

${WASM_TOOLS_BIN} component link -t -o component.wat \
        --dl-openable ${OUT_DIR}/lib-bar.wasm \
        c=${OUT_DIR}/lib-c.wasm \
        foo=${OUT_DIR}/lib-foo.wasm

set +xe
