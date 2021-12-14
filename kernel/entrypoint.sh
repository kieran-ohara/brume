#!/bin/bash -xe
make mvebu_v8_lsp_defconfig
# I seem to have to curb the amount of parallel processes or I get "transport endpoint is not connected".
make -j${MAKE_PARALLEL:-4}
