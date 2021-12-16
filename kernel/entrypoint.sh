#!/bin/bash -xe
# I may not want this for non-brume builds.
make mvebu_v8_lsp_defconfig || true
# I seem to have to curb the amount of parallel processes or I get "transport endpoint is not connected".
make -j${MAKE_PARALLEL:-4}
make -j${MAKE_PARALLEL:-4} modules
make -j${MAKE_PARALLEL:-4} modules_install INSTALL_MOD_PATH=arch/arm64/modules
