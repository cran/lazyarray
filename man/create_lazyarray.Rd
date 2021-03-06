% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_array.R
\name{create_lazyarray}
\alias{create_lazyarray}
\title{Create a lazy-array with given format and dimension}
\usage{
create_lazyarray(
  path,
  storage_format,
  dim,
  dimnames = NULL,
  compress_level = 50L,
  prefix = "",
  multipart = TRUE,
  multipart_mode = 1,
  file_names = NULL,
  meta_name = "lazyarray.meta"
)
}
\arguments{
\item{path}{path to a local drive to store array data}

\item{storage_format}{data type, choices are \code{"double"}, 
\code{"integer"}, \code{"character"}, and \code{"complex"}}

\item{dim}{integer vector, dimension of array, see \code{\link{dim}}}

\item{dimnames}{list of vectors, names of each dimension, see \code{\link{dimnames}}}

\item{compress_level}{0 to 100, level of compression. 0 means
no compression, 100 means maximum compression. For persistent data,
it's recommended to set 100. Default is 50.}

\item{prefix}{character prefix of array partition}

\item{multipart}{whether to split array into multiple partitions, default is true}

\item{multipart_mode}{1, or 2, mode of partition, see details.}

\item{file_names}{data file names without prefix/extensions; see details.}

\item{meta_name}{header file name, default is \code{"lazyarray.meta"}}
}
\value{
A \code{ClassLazyArray} instance
}
\description{
Create a directory to store lazy-array. The path must be missing. See \code{\link{load_lazyarray}} for more details
}
\details{
Lazy array stores array into hard drive, and load them on
demand. It differs from other packages such as \code{"bigmemory"}
that the internal reading uses multi-thread, which gains significant 
speed boost on solid state drives. 

One lazy array contains two parts: data file(s) and a meta file.
The data files can be stored in two ways: non-partitioned and 
partitioned. 

For non-partitioned data array, the dimension is 
set at the creation of the array and cannot be mutable once created

For partitioned data array, there are also two partition modes, 
defined by \code{`multipart_mode`}. For mode 1, each partition 
has the same dimension size as the array. The last dimension is \code{1}.
For example, a data with dimension \code{c(2,3,5)} 
partitioned with mode 1 will have each partition dimension stored
with \code{c(2,3,1)}. For mode 2, the last dimension will be dropped
when storing each partitions.

\code{file_names} is used when irregular partition names should be used.
If \code{multipart=FALSE}, the whole array is stored in a single file under
\code{path}. The file name is \code{<prefix><file_name>.fst}. For example,
by default \code{prefix=""}, and \code{file_name=""}, then \code{path/.fst}
stores the array data. If \code{multipart=TRUE}, then \code{file_names}
should be a character vector of length equal to array's last dimension. A
\code{3x4x5} array has 5 partitions, each partition name follows 
\code{<prefix><file_name>.fst} convention, and one can always use
\code{arr$get_partition_fpath()} to find location of partition files.
For examples, see \code{\link{lazyarray}}.
}
\author{
Zhengjia Wang
}
