# Similar to argparse in python
# Takes command line in put in order to conduct the analysis
library("optparse")

# Command line argument through optparse library
option_list = list(
  make_option(c("-f", "--file"), type="character", default=NULL, 
              help="dataset file name"),
  make_option(c("-o", "--out"), type="character", default="out.txt", 
              help="output file name [default= %default]", metavar="character")
); 

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

if (is.null(opt$file)){
  print_help(opt_parser)
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
}

df = read.table(opt$file, header=TRUE) #opt$file is the variable indicating the input file
num_vars = which(sapply(df, class)=="numeric")
df_out = df[ ,num_vars]
write.table(df_out, file=opt$out, row.names=FALSE) #opt$out is the variable indicating the name of the output file 

# Example code to run this file: 
#Rscript --vanilla Optparse.R -f inputData.txt -o outputResults.txt
