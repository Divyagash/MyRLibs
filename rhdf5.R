source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")

library(rhdf5)
h5createFile("myhdf5file.h5")
h5createGroup("myhdf5file.h5","foo")
h5createGroup("myhdf5file.h5","baa")
h5createGroup("myhdf5file.h5","foo/foobaa")
h5ls("myhdf5file.h5")

# Writing and reading objects with HDF5 format
# h5write function is the function to write an object into hdf5 format
# h5read function is the function to read an object into hdf5 format
