# devtools::load_all() compiles src/neojags.so but does not copy it to
# <lib>/neojags/libs, which is where the package's .onLoad looks for it.
# When the tests run from the source tree, register that freshly compiled
# module with JAGS directly, so the tests exercise the current C++ sources.
# From an installed package (R CMD check) there is no ../../src and the
# module has already been loaded by .onLoad, so this is a no-op.
local({
  src_dir <- testthat::test_path("..", "..", "src")
  module_file <- file.path(src_dir, paste0("neojags", .Platform$dynlib.ext))
  if (!("neojags" %in% rjags::list.modules()) && file.exists(module_file)) {
    rjags::load.module("neojags", path = normalizePath(src_dir), quiet = TRUE)
  }
})
