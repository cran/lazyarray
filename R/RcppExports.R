# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

cpp_create_lazyarray <- function(x, dim, fileName, compression, uniformEncoding) {
    .Call(`_lazyarray_cpp_create_lazyarray`, x, dim, fileName, compression, uniformEncoding)
}

cpp_load_lazyarray <- function(files, partition_locations, partition_dim, ndim, value_type) {
    .Call(`_lazyarray_cpp_load_lazyarray`, files, partition_locations, partition_dim, ndim, value_type)
}

test_fstcore_write <- function(filename) {
    .Call(`_lazyarray_test_fstcore_write`, filename)
}

cpp_fst_meta_orig <- function(fileName) {
    .Call(`_lazyarray_cpp_fst_meta_orig`, fileName)
}

cpp_index_to_index <- function(idx, locations, parent_dim) {
    .Call(`_lazyarray_cpp_index_to_index`, idx, locations, parent_dim)
}

